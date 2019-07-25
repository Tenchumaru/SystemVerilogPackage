using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using HtmlAgilityPack;

namespace mksvgrmr
{
    partial class Program
    {
        private static TextWriter fout;
        private static readonly List<Rule> extras = new List<Rule>();
        private static readonly HashSet<string> literals = new HashSet<string>();

        private static void Print(params object[] args)
        {
            var s = String.Join(" ", args);
            fout.WriteLine(s);
        }

        private static void CreateParser(string outputFilePath, string text)
        {
            // Parse the document, excluding certain useless or terminal-based rules.
            var doc = new HtmlDocument();
            doc.LoadHtml(text);
            var dts = doc.DocumentNode.SelectNodes("//dt");
            var dds = doc.DocumentNode.SelectNodes("//dd");
            var removedRules = new[] { "array_identifier", "covergroup_variable_identifier", "formal_identifier", "block_comment",
                "comment", "comment_text", "one_line_comment" };
            var q = from p in Enumerable.Zip(dts, dds, (t, n) => new { RuleName = t.ChildNodes.First().InnerText, Node = n })
                    where !removedRules.Contains(p.RuleName) && p.Node.SelectNodes("em") == null &&
                    (p.Node.ParentNode.PreviousSibling.PreviousSibling.InnerText != "Numbers" || p.RuleName == "number")
                    select new Rule(p.RuleName, p.Node.ChildNodes.SelectMany(n => AsNodes(n)).GetEnumerator());
            q = q.ToList();

            // Determine if there are any badly-formed literals.
            var badLiteral = literals.FirstOrDefault(l => !l.All(c => Char.IsLetterOrDigit(c) || c == '_'));
            if(badLiteral != null)
            {
                throw new Exception();
            }

            // Perform post-parsing fix-ups.
            q.Single(r => r.Name == "interface_declaration").RightHandSide.AddRange(new[] { "|", "interface_class_declaration" });
            ((List<Rule>)q).Add(new Rule("dotted_identifier", "identifier", "|", "identifier", "'.'", "identifier"));
            ((List<Rule>)q).Add(new Rule("opt_dotted_identifier", "%empty", "|", "dotted_identifier"));
            ReplaceRightHandSide(q, "bind_target_scope", "identifier");
            ReplaceRightHandSide(q, "bins_expression", "dotted_identifier");
            ReplaceRightHandSide(q, "design_statement", "DESIGN_", "opt_dotted_identifier", "';'");
            ReplaceRightHandSide(q, "cell_clause", "CELL_", "dotted_identifier");
            ReplaceRightHandSide(q, "use_clause", Enumerable.Zip(q.Single(r => r.Name == "use_clause").RightHandSide,
                new[] { null, "dotted_identifier", "", null, null, null, null, null, null, null, null, "dotted_identifier", "", null, null, null },
                (a, b) => b ?? a).ToArray());
            q.Single(r => r.Name == "constraint_expression").RightHandSide[21] = "loop_variables";
            q.Single(r => r.Name == "loop_statement").RightHandSide[36] = "loop_variables";
            ReplaceRightHandSide(q, "cell_clause", "CELL_", "dotted_identifier");
            ReplaceRightHandSide(q, "loop_variables", "identifier", "|", "loop_variables", "','", "|", "loop_variables", "','", "identifier");
            ReplaceRightHandSide(q, "input_identifier", Enumerable.Zip(q.Single(r => r.Name == "input_identifier").RightHandSide,
                new[] { "identifier", "", "", null, null, null, null, null },
                (a, b) => b ?? a).ToArray());
            ReplaceRightHandSide(q, "cross_item", "identifier");
            ReplaceRightHandSide(q, "output_identifier", Enumerable.Zip(q.Single(r => r.Name == "output_identifier").RightHandSide,
                new[] { "identifier", "", "", null, null, null, null, null },
                (a, b) => b ?? a).ToArray());
            ReplaceRightHandSide(q, "ps_identifier", "identifier", "|", "package_identifier", "CC", "identifier", "|", "Dunit", "CC", "identifier");
            ReplaceRightHandSide(q, "ps_checker_identifier", "ps_identifier");
            ReplaceRightHandSide(q, "ps_class_identifier", "ps_identifier");
            ReplaceRightHandSide(q, "ps_covergroup_identifier", "ps_identifier");
            ReplaceRightHandSide(q, "ps_type_identifier", "type_identifier", "|", "localCC", "type_identifier", "|", "package_scope", "type_identifier");
            ((List<Rule>)q).Add(new Rule("level_symbol_0n", "%empty", "|", "level_symbol_0n", "level_symbol"));
            ReplaceRightHandSide(q, "seq_input_list", "edge_indicator", "level_symbol_0n", "|", "level_symbol", "level_symbol_0n", "|", "level_symbol", "edge_indicator", "level_symbol_0n");
            ReplaceRightHandSide(q, "sequential_entry", "seq_input_list", "':'", "current_state", "':'", "next_state", "';'", "|", "seq_input_list", "':'", "output_symbol", "';'");
            ReplaceRightHandSide(q, "udp_body", "sequential_body");
            q.Single(r => r.Name == "timeunits_declaration").RightHandSide.RemoveAt(2);
            q.Single(r => r.Name == "timeunits_declaration").RightHandSide.AddRange(new[] { "|", "TIMEUNIT_", "time_literal", "'/'", "time_literal", "':'" });
            ReplaceRightHandSide(q, "implicit_class_handle", "THIS_", "'.'", "|", "SUPER_", "'.'", "|", "THIS_", "'.'", "SUPER_", "'.'");
            q.Single(r => r.Name == "method_call_root").RightHandSide.Insert(1, "'.'");
            q.Single(r => r.Name == "method_call").RightHandSide.RemoveAt(1);
            ReplaceRightHandSide(q, "tagged_union_expression", "TAGGED_", "member_identifier", "|", "TAGGED_ member_identifier", "expression");

            // Add missing rules.
            extras.Add(new Rule("c_identifier", "CID_"));
            extras.Add(new Rule("escaped_identifier", "EID_"));
            extras.Add(new Rule("file_path_spec", "STRING"));
            extras.Add(new Rule("simple_identifier", "CID_", "|", "SID_"));
            extras.Add(new Rule("string_literal", "STRING"));
            extras.Add(new Rule("system_tf_identifier", "SYSID_"));
            extras.Add(new Rule("fixed_point_number", "REAL_NUMBER_")); // only unsigned.unsigned
            extras.Add(new Rule("integral_number", "INTEGRAL_NUMBER_"));
            extras.Add(new Rule("real_number", "REAL_NUMBER_"));
            extras.Add(new Rule("unbased_unsized_literal", "UNBASED_UNSIZED_LITERAL_"));
            extras.Add(new Rule("unsigned_number", "INTEGRAL_NUMBER_"));
            q = q.Concat(extras);

            // Sort the rules and prepare the output.
            q = q.OrderBy(r => r.Name).ToArray();
            using(fout = outputFilePath != null ? File.CreateText(outputFilePath) : Console.Out)
            {
                // Print the token declarations.
                Print("%token INTEGRAL_NUMBER_");
                Print("%token REAL_NUMBER_");
                Print("%token UNBASED_UNSIZED_LITERAL_");
                Print("%token CID_");
                Print("%token EID_");
                Print("%token SID_");
                Print("%token SYSID_");
                Print("%token STRING");
                foreach(var literal in literals.Except(operatorCollections.SelectMany(a => a)).OrderBy(s => s))
                {
                    Print("%token", literal);
                }
                foreach(var operators in operatorCollections.Reverse())
                {
                    Print(String.Join(" ", operators));
                }

                // Print the rule types.
                Print();
                foreach(var item in q)
                {
                    Print("%type<results>", item.Name);
                }

                // Print the separator between the Yacc sections.
                Print();
                Print("%%");
                Print();

                // Print the text.
                Print("text: library_text | source_text ;");
                Print();
                foreach(var item in q)
                {
                    Print(item.Render(q));
                }
            }
        }

        // This method applies fix-ups to address conflicts.  The conflicts are
        // primarily due to semantics.
        private static void ReplaceRightHandSide(IEnumerable<Rule> q, string name, params string[] rightHandSide)
        {
            var rhs = q.Single(r => r.Name == name).RightHandSide;
            rhs.Clear();
            rhs.AddRange(rightHandSide);
            rhs.RemoveAll(s => !s.Any());
        }

        private static IEnumerable<HtmlNode> AsNodes(HtmlNode node)
        {
            if(node.NodeType == HtmlNodeType.Text)
            {
                return from s in node.InnerText.Split(new[] { '\n', '\r', '\t', ' ' }, StringSplitOptions.RemoveEmptyEntries)
                       select HtmlNode.CreateNode(s);
            }
            else
            {
                return new[] { node };
            }
        }
    }
}
