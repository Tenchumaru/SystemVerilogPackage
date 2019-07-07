using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using HtmlAgilityPack;

namespace mksvgrmr
{
    partial class Program
    {
        class LiteralComparer : IComparer<string>
        {
            public int Compare(string x, string y)
            {
                x = x.Split()[0];
                y = y.Split()[0];
                if(x == y)
                {
                    return 0;
                }
                var result = Comparer<int>.Default.Compare(x.Length, y.Length);
                if(result == 0)
                {
                    return Comparer<string>.Default.Compare(x, y);
                }
                return -result;
            }
        }

        private static bool IsLiteralNode(HtmlNode node)
        {
            return node.NodeType == HtmlNodeType.Element && node.Name == "font" &&
                node.Attributes.Single().Value == "purple" && node.ChildNodes.Single().Name == "b";
        }

        private static string AsLiteral(HtmlNode node) => Unescape(node.ChildNodes.Single().InnerText.Trim());

        private static bool LiteralRequiresQuotes(string literal) => !literal.All(c => c == '_' || Char.IsLetterOrDigit(c));

        private static string AsOutputLine(string literal)
        {
            var token = AsToken(literal);
            return LiteralRequiresQuotes(literal) ?
                $"\"{literal + '"',-24}{{ return DBOUT({token}, Operator); }}" :
                $"{literal,-25}{{ return DBOUT({token}, Identifier); }}";
        }

        private static void CreateScanner(string outputFilePath, string text)
        {
            // Collect literal tokens from the document, excluding those in
            // certain useless or terminal-based rules.
            var doc = new HtmlDocument();
            doc.LoadHtml(text);
            var dts = doc.DocumentNode.SelectNodes("//dt");
            var dds = doc.DocumentNode.SelectNodes("//dd");
            var removedRules = new[] { "array_identifier", "covergroup_variable_identifier", "formal_identifier", "block_comment",
                "comment", "comment_text", "one_line_comment" };
            var q = (from p in Enumerable.Zip(dts, dds, (t, d) => new { RuleName = t.ChildNodes.First().InnerText, Node = d })
                     where !removedRules.Contains(p.RuleName) && p.Node.SelectNodes("em") == null &&
                     (p.Node.ParentNode.PreviousSibling.PreviousSibling.InnerText != "Numbers" || p.RuleName == "number")
                     from n in p.Node.ChildNodes
                     where IsLiteralNode(n)
                     let s = AsLiteral(n)
                     where s.Length > 1
                     select s).OrderBy(s => s, new LiteralComparer()).Distinct();

            // Print the output.
            using(fout = outputFilePath != null ? File.CreateText(outputFilePath) : Console.Out)
            {
                foreach(var item in q)
                {
                    Print(AsOutputLine(item));
                }
                var numbers = new[] {
                    "{bin}           |",
                    "{dec}           |",
                    "{hex}           |",
                    "{num}           { return DBOUT(INTEGRAL_NUMBER_, Literal); }",
                    "{fix}           |",
                    "{flt}           { return DBOUT(REAL_NUMBER_, Literal); }",
                    "{uul}           { return DBOUT(UNBASED_UNSIZED_LITERAL_, Literal); }",
                    "{cid}           { return DBOUT(CID_, Identifier); }",
                    "{eid}           { return DBOUT(EID_, Identifier); }",
                    "{sid}           { return DBOUT(SID_, Identifier); }",
                    "{syd}           { return DBOUT(SYSID_, Identifier); }",
                };
                Print(String.Join(Environment.NewLine, numbers));
            }
        }
    }
}
