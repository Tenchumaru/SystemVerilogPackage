using System.Collections.Generic;
using System.Runtime.InteropServices;
using Microsoft.VisualStudio.Package;
using Microsoft.VisualStudio.TextManager.Interop;

namespace Adrezdi.SystemVerilogPackage
{
    internal class SystemVerilogScanner : IScanner
    {
        private static readonly Dictionary<TokenType, TokenColor> tokenDict = new Dictionary<TokenType, TokenColor> {
            { TokenType.Unknown, TokenColor.Text },
            { TokenType.Text, TokenColor.Text },
            { TokenType.Keyword, TokenColor.Keyword },
            { TokenType.Identifier, TokenColor.Identifier },
            { TokenType.String, TokenColor.String },
            { TokenType.Literal, TokenColor.Number },
            { TokenType.Operator , TokenColor.Text },
            { TokenType.Delimiter, TokenColor.Text },
            { TokenType.WhiteSpace, TokenColor.Text },
            { TokenType.LineComment, TokenColor.Comment },
            { TokenType.Comment, TokenColor.Comment },
        };
        private readonly IVsTextBuffer buffer;
        private string source;
        private int offset;

        public SystemVerilogScanner(IVsTextBuffer buffer)
        {
            this.buffer = buffer;
        }
        public bool ScanTokenAndProvideInfoAboutIt(TokenInfo tokenInfo, ref int state)
        {
            bool foundToken = false;
            if(tokenInfo != null)
            {
                foundToken = GetNextToken(offset, tokenInfo, state);
                if(foundToken)
                {
                    offset = tokenInfo.EndIndex + 1;
                    if(tokenInfo.Type == TokenType.Comment)
                    {
                        state = offset >= 2 && source.Length >= offset && source.Substring(offset - 2, 2) == "*/" ? 0 : 1;
                    }
                }
            }
            return foundToken;
        }

        public void SetSource(string source, int offset)
        {
            this.source = source;
            this.offset = offset;
        }

        private bool GetNextToken(int startIndex, TokenInfo tokenInfo, int state)
        {
            bool foundToken = false;
            tokenInfo.Color = TokenColor.Text;
            int index = startIndex;
            if(index < source.Length)
            {
                tokenInfo.StartIndex = index;
                tokenInfo.Type = GetTokenType(source, state != 0, ref index);
                tokenInfo.Color = tokenDict[tokenInfo.Type];
                tokenInfo.EndIndex = index;
                foundToken = true;
            }
            return foundToken;
        }

        [DllImport("Utility.dll", CallingConvention = CallingConvention.Cdecl)]
        [return: MarshalAs(UnmanagedType.I4)]
        public static extern TokenType GetTokenType([MarshalAs(UnmanagedType.LPStr)] string s, bool isInComment, ref int index);
    }
}
