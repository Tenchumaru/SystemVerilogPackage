using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using Microsoft.VisualStudio.Package;
using Microsoft.VisualStudio.TextManager.Interop;

namespace Adrezdi.SystemVerilogPackage
{
    internal class SystemVerilogSource : Source
    {
        private static CommentInfo commentInfo = new CommentInfo
        {
            LineStart = "//",
            BlockStart = "/*",
            BlockEnd = "*/",
            UseLineComments = true,
        };
        private IVsTextLines buffer;
        private ParseResults[] results;

        public SystemVerilogSource(LanguageService service, IVsTextLines buffer)
            : base(service, buffer, service.GetColorizer(buffer))
        {
            // See http://msdn.microsoft.com/en-us/library/bb135688.aspx
            // for why I set LastParseTime to zero here.
            base.LastParseTime = 0;
            this.buffer = buffer;
        }

        public override TextSpan CommentSpan(TextSpan span)
        {
            var rv = default(TextSpan);
            Compose("Comment Selection", () =>
            {
                if(span.iStartLine == span.iEndLine)
                    rv = base.CommentBlock(span, commentInfo.BlockStart, commentInfo.BlockEnd);
                else
                {
                    if(span.iEndIndex == 0)
                    {
                        --span.iEndLine;
                        int lineLength;
                        buffer.GetLengthOfLine(span.iEndLine, out lineLength);
                        span.iEndIndex = lineLength;
                    }
                    rv = base.CommentLines(span, commentInfo.LineStart);
                }
            });
            return rv;
        }

        enum FormatState { Initial, KeywordIndented, KeywordOpened, Opened, Begun }

        public override void ReformatSpan(EditArray mgr, TextSpan span)
        {
            Compose("Reformat Code", () =>
            {
                if(results != null)
                {
                    int lastUneditedLine = span.iStartLine;
                    int end = span.iEndLine + (span.iEndIndex == 0 ? 0 : 1);
                    var q = from r in results
                            where r.Line >= span.iStartLine && r.Line < end
                            orderby r.Line, r.Column
                            group r by r.Line into g
                            select new { Line = GetLine(g.Key), Results = g };
                    foreach(var item in q)
                    {
                        var firstResult = item.Results.First();
                        var indenting = new string('\t', firstResult.IndentLevel);
                        for(; lastUneditedLine <= firstResult.Line; ++lastUneditedLine)
                        {
                            var currentLineText = lastUneditedLine == firstResult.Line ? item.Line : GetLine(lastUneditedLine);
                            var newLineText = currentLineText.Trim();
                            if(newLineText.Any())
                                newLineText = indenting + newLineText;
                            if(newLineText != currentLineText)
                            {
                                var lineSpan = new TextSpan
                                {
                                    iStartLine = lastUneditedLine,
                                    iEndLine = lastUneditedLine,
                                    iStartIndex = 0,
                                    iEndIndex = currentLineText.Length,
                                };
                                var edit = new EditSpan(lineSpan, newLineText);
                                mgr.Add(edit);
                            }
                        }
                    }
                }
                mgr.ApplyEdits();
            });
        }

        public override TextSpan UncommentSpan(TextSpan span)
        {
            return Compose<TextSpan>("Uncomment Selection", () =>
            {
                string s;
                buffer.GetLineText(span.iStartLine, span.iStartIndex, span.iEndLine, span.iEndIndex, out s);
                if(s.StartsWith(commentInfo.BlockStart) && s.EndsWith(commentInfo.BlockEnd))
                    return base.UncommentBlock(span, commentInfo.BlockStart, commentInfo.BlockEnd);
                else
                    return base.UncommentLines(span, commentInfo.LineStart);
            });
        }

        private void Compose(string description, Action action)
        {
            using(var ca = new CompoundAction(this, description))
            {
                ca.FlushEditActions();
                action();
            }
        }

        private T Compose<T>(string description, Func<T> fn)
        {
            using(var ca = new CompoundAction(this, description))
            {
                ca.FlushEditActions();
                return fn();
            }
        }

        internal void Parse(string s)
        {
            int count;
            var parse = ParseText(s, out count);
            if(parse != IntPtr.Zero)
            {
                results = new ParseResults[count];
                GetParseResults(parse, results, count);
            }
        }

        private enum WhitespaceBehavior { Zero, One, StartOfLine, Newline, CanStartLine, };

        [StructLayout(LayoutKind.Sequential)]
        private struct ParseResults
        {
            public int Line, Column, IndentLevel;
            public WhitespaceBehavior Before, After;
        }

        [DllImport("Utility.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr ParseText([MarshalAs(UnmanagedType.LPStr)] string s, out int count);

        [DllImport("Utility.dll", CallingConvention = CallingConvention.Cdecl)]
        private static extern void GetParseResults(IntPtr parse, [Out, MarshalAs(UnmanagedType.LPArray, SizeParamIndex = 2)] ParseResults[] results, int count);
    }
}
