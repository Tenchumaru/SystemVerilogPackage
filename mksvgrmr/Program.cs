using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace mksvgrmr
{
    class Program
    {
        private static TextWriter fout;
        private static Regex ws = new Regex(@"[\s]+", RegexOptions.Compiled);
        private static Dictionary<string, Rule> optionalItems = new Dictionary<string, Rule>();
        private static Dictionary<string, Rule> repeatedItems = new Dictionary<string, Rule>();
        private static Dictionary<string, int> choices = new Dictionary<string, int>();
        private static Regex repeatedRx = new Regex(@"[^']\{([^{}]*)\}", RegexOptions.Compiled);
        private static Regex optionalRx = new Regex(@"[^']\[([^\[\]]*)\]", RegexOptions.Compiled);
        private static string[] leftTokens = { "==", "===", "!=", "!==", "=?=", "!?=", "&&", "||", "**", ">=", ">>", "<<", ">>>", "<<<" };
        private static string[] rightTokens = { "+=", "-=", "*=", "/=", "%=", "&=", "|=", "^=", "<<=", ">>=", "<<<=", ">>>=" };

        static void Print(params object[] args)
        {
            var s = String.Join(" ", args);
            fout.WriteLine(s);
        }

        static void Main(string[] args)
        {
            // Parse the command line arguments.
            bool excludeIdentifiers = false;
            if(args[0] == "-i")
            {
                excludeIdentifiers = true;
                args = args.Skip(1).ToArray();
            }
            string lastSection = excludeIdentifiers ? "A.9.4" : "A.9.3";
            var text = File.ReadAllText(args[0]);

            // Include only modules through identifier branches and exclude comments and strings.
            text = text.Split(new[] { "A.1.3" }, StringSplitOptions.RemoveEmptyEntries)[1].Split(new[] { "A.9.5" }, StringSplitOptions.RemoveEmptyEntries)[0];
            text = Regex.Replace(text, @"^[\S\s]+?H2.", "", RegexOptions.IgnoreCase);
            text = text.Split(new[] { "A.9.2" }, StringSplitOptions.RemoveEmptyEntries)[0] + text.Split(new[] { lastSection }, StringSplitOptions.RemoveEmptyEntries)[1];
            text = text.Split(new[] { "A.8.8" }, StringSplitOptions.RemoveEmptyEntries)[0] + text.Split(new[] { "A.9.1" }, StringSplitOptions.RemoveEmptyEntries)[1];

            // Apply fixes.
            text = Regex.Replace(text, @"<.span>\s*:\s", ":</span> ", RegexOptions.IgnoreCase); // broken literal
            text = Regex.Replace(text, @"this[^.]*.", "this</SPAN> <SPAN CLASS=\"BNFkeyword\">.</SPAN> ");
            text = Regex.Replace(text, @"super[^.]*.", "super</SPAN> <SPAN CLASS=\"BNFkeyword\">.</SPAN> ");
            text = Regex.Replace(text, @"::=\s*<.p>", "::= ", RegexOptions.IgnoreCase);

            // Remove C identifiers.
            if(!excludeIdentifiers)
            {
                ReplaceIdentifier("1267956", "c_identifier ::= ID", ref text);
                ReplaceIdentifier("1031035", "simple_identifier ::= IDD", ref text);
                ReplaceIdentifier("1031041", "system_function_identifier ::= DID", ref text);
                ReplaceIdentifier("1031043", "system_task_identifier ::= DID", ref text);
            }

            // Remove superscripts.
            text = Regex.Replace(text, @"<span\s*class..superscript[\S\s]*?span>", " ", RegexOptions.IgnoreCase);

            // Replace HTML token specifications with fancily quoted ones.
            var rx = new Regex(@".span class..BNFkeyword..\s*([\S\s]*?)\s*..span.", RegexOptions.Compiled | RegexOptions.IgnoreCase);
            Match parts;
            for(int i = 0; (parts = rx.Match(text, i)).Success;)
            {
                i = parts.Index;
                var token = parts.Groups[1].Value;
                var literals = ws.Split(token);
                token = " @''" + String.Join("''@ @''", literals) + "''@ ";
                text = text.Substring(0, parts.Index) + token + text.Substring(parts.Index + parts.Length);
            }

            // To enable easier repeated and optional item replacement, use a
            // different place-holder for literal square brackets and curly braces.
            text = text.Replace("@''[''@", "@@OSB@@").Replace("@'']''@", "@@CSB@@").Replace("@''{''@", "@@OCB@@").Replace("@''}''@", "@@CCB@@");

            // Remove anchor, break, emphasis, and header tags.
            text = Regex.Replace(text, @"<a[\S\s]*?>", " ", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"<.a>", " ", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"<br[^>]*.", " ", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"<em[\S\s]*?>", " ", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"<.em>", " ", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"<h2[\S\s]+?h2>", " ", RegexOptions.IgnoreCase);

            // Remove the opening paragraph tags and replace the closing paragraph tags with a fancily formatted Yacc-rule-ending semicolon.
            text = Regex.Replace(text, @"<p\s*class..bnf_syntaxitem.>", " ", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"<.p>", " ;;; ", RegexOptions.IgnoreCase);

            // Remove the rest of the tags.
            text = Regex.Replace(text, @"<[\S\s]*?>", " ", RegexOptions.IgnoreCase);

            // Replace the entities.
            text = text.Replace("&lt;", "<").Replace("&gt;", ">").Replace("&amp;", "&").Replace("&quot;", @"\");

            // Replace single-character literals with themselves.
            text = text.Replace("@'''''@", @"'\''").Replace(@"@''\''@", @"'\\'");
            text = Regex.Replace(text, "@'('.')'@", "$1", RegexOptions.IgnoreCase);
            text = Regex.Replace(text, @"\s+([,;:=()])\s+", " '$1' ");

            // Replace multi-character literals with a capitalized symbol.
            var tokens = new Dictionary<string, string>();
            rx = new Regex(@"@''(\S+?)''@", RegexOptions.Compiled);
            for(int i = 0, j = 0; (parts = rx.Match(text, i)).Success;)
            {
                i = parts.Index;
                var key = parts.Groups[1].Value;
                string name;
                if(tokens.ContainsKey(key))
                {
                    name = tokens[key];
                }
                else
                {
                    name = Char.ToLower(key[0]) < 'a' || Char.ToLower(key[0]) > 'z' || Regex.IsMatch(key, @"\W") ? "TOKEN" + ++j : key.ToUpper() + "_";
                    tokens[key] = name;
                }
                text = rx.Replace(text, " " + name + " ", 1);
            }

            // Remove scanner-level constructs.
            text = Regex.Replace(text, @"\sescaped_identifier\s*::=[^;]+...", " ");
            text = Regex.Replace(text, @"\scell_identifier\s*::=[^;]+...", " ");
            text = Regex.Replace(text, @"\sconfig_identifier\s*::=[^;]+...", " ");
            text = Regex.Replace(text, @"\sinstance_identifier\s*::=[^;]+...", " ");
            text = Regex.Replace(text, @"\slibrary_identifier\s*::=[^;]+...", " ");
            text = Regex.Replace(text, @"\stext_macro_identifier\s*::=[^;]+...", " ");
            text = Regex.Replace(text, @"\stopmodule_identifier\s*::=[^;]+...", " ");
            text = text.Replace("escaped_identifier", "EID");
            text = text.Replace("string_literal", "STRING");
            text = Regex.Replace(text, @"\} \[ \{([^:]*)\} \]", "} { $1 }");

            // Handle repeated items, optional items, and embedded choices.
            ReplaceRepeatedItems(ref text);
            ReplaceOptionalItems(ref text);
            AddChoices(ref text);

            // Restore the literal brackets and braces.
            string fn(string s)
            {
                return s.Replace("@@OSB@@", "'['").Replace("@@CSB@@", "']'").Replace("@@OCB@@", "'{'").Replace("@@CCB@@", "'}'");
            }
            text = fn(text);

            // Replace all white space with a single space.
            text = ws.Replace(text, " ");

            // Replace invalid nonterminal names.
            text = text.Replace(" $", " _d_");

            // Format for human readability.
            text = Regex.Replace(text, @"\s+(\w+)\s*:?:=\s*", "\r\n$1:\r\n");
            text = Regex.Replace(text, @"\s+\|\s*", "\r\n| ");
            text = Regex.Replace(text, @"\s+;;;\s*", "\r\n;\r\n\r\n");
            text = text.Trim();

            // Prepare the output.
            using(fout = args.Length > 1 ? File.CreateText(args[1]) : Console.Out)
            {
                // Print the token declarations.
                Print("%token ID");
                Print("%token EID");
                Print("%token DID");
                Print("%token IDD");
                Print("%token STRING");
                foreach(var pair in tokens)
                {
                    string tokenType = leftTokens.Contains(pair.Key) ? "%left" : rightTokens.Contains(pair.Key) ? "%right" : "%token";
                    Print(tokenType, pair.Value, '"' + pair.Key.Replace(@"\", @"\\") + '"');
                }

                // Print the separator between the Yacc sections.
                Print();
                Print("%%");
                Print();

                // Print the text.
                Print(text);

                // Print the repeated item rules.
                foreach(var part in repeatedItems.Values)
                {
                    Print();
                    Print(part.name + ":");
                    Print("%empty");
                    Print("|", part.name, fn(String.Join(" ", part.rhs)));
                    Print(';');
                }

                // Print the optional item rules.
                foreach(var part in optionalItems.Values)
                {
                    Print();
                    Print(part.name + ":");
                    Print("%empty");
                    Print("|", fn(String.Join(" ", part.rhs)));
                    Print(';');
                }
            }
        }

        private static void AddChoices(ref string text)
        {
            string s = "";
            foreach(var item in choices)
            {
                s += $" choice_{item.Value} ::= {item.Key} ;;; ";
            }
            text += s;
        }

        private static void ReplaceOptionalItems(ref string text)
        {
            // Replace optional items with a new rule.
            Match parts;
            for(int i = 0; (parts = optionalRx.Match(text)).Success;)
            {
                i = parts.Index;
                var s = parts.Groups[1].Value;
                CheckForChoice(ref s, ref text);
                ReplaceRepeatedItems(ref s);
                var rhs = ws.Split(s.Trim());
                var key = String.Join(":", rhs);
                string name;
                if(optionalItems.ContainsKey(key))
                {
                    name = optionalItems[key].name;
                }
                else
                {
                    name = "optional_" + optionalItems.Count;
                    optionalItems[key] = new Rule { name = name, rhs = rhs };
                }
                text = optionalRx.Replace(text, " " + name + " ", 1, i);
            }
        }

        private static void ReplaceRepeatedItems(ref string text)
        {
            // Replace repeated items with a new rule.
            Match parts;
            for(int i = 0; (parts = repeatedRx.Match(text)).Success;)
            {
                i = parts.Index;
                var s = parts.Groups[1].Value;
                CheckForChoice(ref s, ref text);
                ReplaceOptionalItems(ref s);
                var rhs = ws.Split(s.Trim());
                var key = String.Join(":", rhs);
                string name;
                if(repeatedItems.ContainsKey(key))
                {
                    name = repeatedItems[key].name;
                }
                else
                {
                    name = "repeated_" + repeatedItems.Count;
                    repeatedItems[key] = new Rule { name = name, rhs = rhs };
                }
                text = repeatedRx.Replace(text, " " + name + " ", 1, i);
            }
        }

        private static void CheckForChoice(ref string s, ref string text)
        {
            var ar = s.Split('|');
            if(ar.Length > 1)
            {
                s = ws.Replace(s, " ").Trim();
                int i;
                if(choices.ContainsKey(s))
                    i = choices[s];
                else
                {
                    i = choices.Count;
                    choices.Add(s, i);
                }
                s = $" choice_{i} ";
            }
        }

        private static void ReplaceIdentifier(string pgfId, string rule, ref string text)
        {
            int i = text.IndexOf(pgfId);
            i = text.LastIndexOf("<p", i, StringComparison.InvariantCultureIgnoreCase);
            int j = text.IndexOf("</p>", i, StringComparison.InvariantCultureIgnoreCase);
            text = text.Substring(0, i) + " " + rule + " ;;; " + text.Substring(j + 4);
        }
    }

    class Rule
    {
        public string name;
        public string[] rhs;

        public override string ToString() => $"{name}: {String.Join(" ", rhs)}";
    }
}
