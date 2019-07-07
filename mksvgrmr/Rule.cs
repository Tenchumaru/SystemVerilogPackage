using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HtmlAgilityPack;

namespace mksvgrmr
{
    partial class Program
    {
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
    }
}
