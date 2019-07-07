using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using HtmlAgilityPack;

namespace mksvgrmr
{
    partial class Program
    {
        // Table 11-2:  Operator precedence and associativity, p. 221
        private static readonly string[][] tokenCollections = ProcessTokens(new[] {
            new[] { "left", "()", "[]", "::", "." },
            new[] { "token", "!", "~", "~&", "~|", "++", "--" },
            new[] { "left", "**" },
            new[] { "left", "*", "/", "%" },
            new[] { "left", "+", "-" },
            new[] { "left", "<<", ">>", "<<<", ">>>" },
            new[] { "left", "<", "<=", ">", ">=", "inside", "dist" },
            new[] { "left", "==", "!=", "===", "!==", "==?", "!=?" },
            new[] { "left", "&" },
            new[] { "left", "^", "~^", "^~" },
            new[] { "left", "|" },
            new[] { "left", "&&" },
            new[] { "left", "||" },
            new[] { "right", "?", ":" },
            new[] { "right", "->", "<->" },
            new[] { "nonassoc", "=", "+=", "-=", "*=", "/=", "%=", "&=", "^=", "|=", "<<=", ">>=", "<<<=", ">>>=", ":=", ":/" },
            new[] { "token", "{}", "{{}}" },
        });

        private static string[][] ProcessTokens(string[][] tokens)
        {
            var q = tokens.Select(a => a.Select((s, i) => i == 0 ? '%' + s : s.Length == 1 ? String.Format("'{0}'", s) : Rule.AsLiteral(s)).ToArray());
            return q.ToArray();
        }

        private static TextWriter fout;
        private static readonly List<Rule> extras = new List<Rule>();
        private static readonly HashSet<string> literals = new HashSet<string>();

        private static void Print(params object[] args)
        {
            var s = String.Join(" ", args);
            fout.WriteLine(s);
        }

        private static void CreateParser(string[] args, string text)
        {
            // Perform pre-parsing fix-ups.
            text = text.Replace("wand | wor", "wand</b></font> <br> | <font color=\"purple\"><b>wor");

            // Parse the document, excluding certain useless or terminal-based rules.
            var doc = new HtmlDocument();
            doc.LoadHtml(text);
            var dts = doc.DocumentNode.SelectNodes("//dt");
            var dds = doc.DocumentNode.SelectNodes("//dd");
            var removedRules = new[] { "array_identifier", "covergroup_variable_identifier", "formal_identifier", "block_comment",
                "comment", "comment_text", "one_line_comment" };
            var q = from p in Enumerable.Zip(dts, dds, (t, n) => new { RuleName = t.ChildNodes.First().InnerText, Node = n })
                    where !removedRules.Contains(p.RuleName) && p.Node.SelectNodes("em") == null &&
                    (!p.Node.ParentNode.PreviousSibling.PreviousSibling.InnerText.Contains("Numbers") || p.RuleName == "number")
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

            // Add missing rules.
            extras.Add(new Rule("c_identifier", "CID_"));
            extras.Add(new Rule("escaped_identifier", "EID_"));
            extras.Add(new Rule("file_path_spec", "STRING_"));
            extras.Add(new Rule("simple_identifier", "SID_"));
            extras.Add(new Rule("string_literal", "STRING_"));
            extras.Add(new Rule("system_tf_identifier", "SYSID_"));
            extras.Add(new Rule("fixed_point_number", "REAL_NUMBER_")); // only unsigned.unsigned
            extras.Add(new Rule("integral_number", "INTEGRAL_NUMBER_"));
            extras.Add(new Rule("real_number", "REAL_NUMBER_"));
            extras.Add(new Rule("unbased_unsized_literal", "UNBASED_UNSIZED_LITERAL_"));
            extras.Add(new Rule("unsigned_number", "INTEGRAL_NUMBER_"));
            q = q.Concat(extras).ToArray();

            // Prepare the output.
            using(fout = args.Length > 1 ? File.CreateText(args[1]) : Console.Out)
            {
                // Print the token declarations.
                Print("%token INTEGRAL_NUMBER_");
                Print("%token REAL_NUMBER_");
                Print("%token UNBASED_UNSIZED_LITERAL_");
                Print("%token CID_");
                Print("%token EID_");
                Print("%token SID_");
                Print("%token SYSID_");
                foreach(var literal in literals.Except(tokenCollections.SelectMany(a => a)).OrderBy(s => s))
                {
                    Print("%token", literal);
                }
                foreach(var tokens in tokenCollections.Reverse())
                {
                    Print(String.Join(" ", tokens));
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
