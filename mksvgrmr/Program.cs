using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace mksvgrmr
{
    partial class Program
    {
        private static readonly Dictionary<char, string> characterEscapeMap = new Dictionary<char, string>
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

        static void Main(string[] args)
        {
            if(args.Length < 2 || args.Length > 3 || !new[] { "parser", "scanner" }.Contains(args[0]))
            {
                Console.WriteLine("usage: mksvgrmr parser|scanner inputHtmlFile [outputFile]");
                Environment.Exit(2);
            }

            // Parse the command line arguments.
            string text;
            if(args.Length > 1)
            {
                var filePath = args[1];
                text = File.ReadAllText(filePath);
            }
            else
            {
                var client = new System.Net.WebClient();
                text = client.DownloadString("https://insights.sigasi.com/tech/systemverilog.ebnf.html");
            }

            // Perform pre-parsing fix-ups.
            text = text.Replace("wand | wor", "wand</b></font> <br> | <font color=\"purple\"><b>wor");

            string outputFilePath = args.Length > 2 ? args[2] : null;
            if(args[0] == "parser")
            {
                CreateParser(outputFilePath, text);
            }
            else
            {
                CreateScanner(outputFilePath, text);
            }
        }

        private static string Unescape(string s) => s.Replace("&gt;", ">").Replace("&lt;", "<").Replace("&amp;", "&");

        private static string AsToken(string literal)
        {
            if(Char.IsLower(literal[0]) && literal.Skip(1).All(c => Char.IsLower(c) || Char.IsDigit(c) || c == '_'))
            {
                return literal.ToUpperInvariant() + '_';
            }
            string s;
            s = String.Join("", from c in literal select characterEscapeMap.TryGetValue(c, out s) ? s : c.ToString());
            return Char.IsDigit(s[0]) ? "_" + s : s;
        }

        private static string[][] ProcessOperators(string[][] operators)
        {
            var q = operators.Select(a => a.Select((s, i) => i == 0 ? '%' + s : s.Length == 1 ? String.Format("'{0}'", s) : AsToken(s)).ToArray());
            return q.ToArray();
        }

        // Table 11-2:  Operator precedence and associativity, p. 221
        private static readonly string[][] operatorCollections = ProcessOperators(new[] {
            new[] { "left", "()", "[]", "::", "." },
            new[] { "token", "!", "~", "~&", "~|", "++", "--" },
            new[] { "left", "**" },
            new[] { "left", "*", "/", "%" },
            new[] { "left", "+", "-" },
            new[] { "left", "<<", ">>", "<<<", ">>>" },
            new[] { "nonassoc", "tagged" },
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
    }
}
