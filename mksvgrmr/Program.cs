using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using HtmlAgilityPack;

namespace mksvgrmr
{
    class Program
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

        class Rule
        {
            public string Name { get; private set; }
            public List<string> RightHandSide { get; private set; } = new List<string>();
            private static readonly Dictionary<char, string> literalMap = new Dictionary<char, string>
            {
                { '&', "AMP" },
                { '@', "AT" },
                { '\'', "APOS" },
                { '!', "BANG" },
                { ':', "C" },
                { ')', "CP" },
                { '}', "CCB" },
                { ']', "CSB" },
                { '$', "D" },
                { '.', "DOT" },
                { '=', "E" },
                { '>', "G" },
                { '^', "H" },
                { '<', "L" },
                { '-', "M" },
                { '#', "N" },
                { '(', "OP" },
                { '{', "OCB" },
                { '[', "OSB" },
                { '%', "P" },
                { '?', "Q" },
                { '+', "PLUS" },
                { '|', "PIPE" },
                { '*', "S" },
                { '~', "T" },
                { ';', "SEMI" },
                { '/', "V" },
            };

            internal Rule(string name, string rightHandSide)
            {
                Name = name;
                RightHandSide.Add(rightHandSide);
            }

            internal Rule(string name, IEnumerator<HtmlNode> nodes)
            {
                Name = name;
                while(nodes.MoveNext())
                {
                    var n = nodes.Current;
                    var innerText = n.InnerText.Trim();
                    if(n.NodeType == HtmlNodeType.Text)
                    {
                        if(innerText == "{" || innerText == "[")
                        {
                            var s = $"{name}_{extras.Count}";
                            var r = new Rule(s, nodes);
                            extras.Add(r);
                            RightHandSide.Add(s);
                        }
                        else if(innerText == "]")
                        {
                            // This is the end of a zero-or-one sub-rule.
                            RightHandSide.InsertRange(0, new[] { "%empty", "|" });
                            return;
                        }
                        else if(innerText == "}")
                        {
                            // This is the end of a zero-or-more sub-rule.
                            RightHandSide.InsertRange(0, new[] { "%empty", "|", name });
                            return;
                        }
                        else if(innerText == "|")
                        {
                            RightHandSide.Add("|");
                        }
                        else if(!innerText.Any())
                        {
                            // Ignore whitespace.
                        }
                        else
                        {
                            throw new Exception();
                        }
                    }
                    else if(n.NodeType == HtmlNodeType.Element)
                    {
                        if(n.Name == "a" && n.ChildNodes.Single().NodeType == HtmlNodeType.Text)
                        {
                            RightHandSide.Add(innerText);
                        }
                        else if(n.Name == "br" && !n.ChildNodes.Any())
                        {
                            // Ignore line breaks.
                        }
                        else if(n.Name == "sup")
                        {
                            // Ignore superscripts.
                        }
                        else if(n.Name == "font" && n.Attributes.Single().Value == "purple" && n.ChildNodes.Single().Name == "b")
                        {
                            var literal = Unescape(n.ChildNodes[0].InnerText.Trim());
                            if(literal == "'")
                            {
                                literal = "'\\''";
                            }
                            else if(literal.Length == 1)
                            {
                                literal = $"'{literal}'";
                            }
                            else
                            {
                                literal = AsLiteral(literal);
                                literals.Add(literal);
                            }
                            RightHandSide.Add(literal);
                        }
                        else
                        {
                            throw new Exception();
                        }
                    }
                    else
                    {
                        throw new Exception();
                    }
                }
            }

            public override string ToString() => Name + ": " + String.Join(" ", RightHandSide);

            private string Unescape(string s) => s.Replace("&gt;", ">").Replace("&lt;", "<").Replace("&amp;", "&");

            internal static string AsLiteral(string literal)
            {
                if(literal.All(c => Char.IsLower(c)))
                {
                    return literal.ToUpperInvariant() + '_';
                }
                string s;
                s = String.Join("", from c in literal select literalMap.TryGetValue(c, out s) ? s : c.ToString());
                return Char.IsDigit(s[0]) ? "_" + s : s;
            }

            internal string Render(IEnumerable<Rule> rules)
            {
                // Separate right-hand sides.
                var rightHandSides = new List<List<string>> { new List<string>() };
                foreach(var item in RightHandSide)
                {
                    if(item == "|")
                    {
                        rightHandSides.Add(new List<string>());
                    }
                    else
                    {
                        rightHandSides.Last().Add(item);
                    }
                }

                var sb = new StringBuilder(Name);
                sb.Append(':').AppendLine();
                RenderRightHandSide(rules, sb, rightHandSides[0]);
                foreach(var rightHandSide in rightHandSides.Skip(1))
                {
                    sb.Append("| ");
                    RenderRightHandSide(rules, sb, rightHandSide);
                }
                sb.Append(';').AppendLine();
                return sb.ToString();
            }

            private void RenderRightHandSide(IEnumerable<Rule> rules, StringBuilder sb, List<string> rightHandSide)
            {
                sb.Append(String.Join(" ", rightHandSide));
                if(rightHandSide.Count > 1)
                {
                    sb.Append(" {");
                    if(rightHandSide[0] == Name || rules.Any(r => r.Name == rightHandSide[0]))
                    {
                        sb.Append(" $$ = $1;");
                    }
                    else
                    {
                        sb.Append(" C($$); T($$, @1, zero, zero);");
                    }
                    foreach(var item in rightHandSide.Select((s, i) => new { Name = s, Number = i + 1 }).Skip(1))
                    {
                        if(rules.Any(r => r.Name == item.Name))
                        {
                            sb.Append($" P($$, ${item.Number});");
                        }
                        else
                        {
                            sb.Append($" T($$, @{item.Number}, zero, zero);");
                        }
                    }
                    sb.Append(" }");
                }
                else if(rightHandSide[0] == "%empty")
                {
                    sb.Append(" { C($$); }");
                }
                else if(!rules.Any(r => r.Name == rightHandSide[0]))
                {
                    sb.Append(" { C($$); T($$, @1, zero, zero); }");
                }
                sb.AppendLine();
            }
        }

        static void Print(params object[] args)
        {
            var s = String.Join(" ", args);
            fout.WriteLine(s);
        }

        static void Main(string[] args)
        {
            // Parse the command line arguments.
            string text;
            if(args.Any())
            {
                var filePath = args.First();
                text = File.ReadAllText(filePath);
            }
            else
            {
                var client = new System.Net.WebClient();
                text = client.DownloadString("https://insights.sigasi.com/tech/systemverilog.ebnf.html");
            }

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
