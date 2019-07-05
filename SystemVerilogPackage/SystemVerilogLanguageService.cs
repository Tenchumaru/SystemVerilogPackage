using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;
using Microsoft.VisualStudio.Package;
using Microsoft.VisualStudio.TextManager.Interop;

namespace Adrezdi.SystemVerilogPackage
{
    [Guid(GuidList.SystemVerilogLanguage)]
    internal class SystemVerilogLanguageService : LanguageService
    {
        private LanguagePreferences preferences;
        private SystemVerilogScanner scanner;
        private readonly Dictionary<string, SystemVerilogSource> sources = new Dictionary<string, SystemVerilogSource>();

        public override string GetFormatFilterList()
        {
            return "SystemVerilog Files (*.sv)|*.sv";
        }

        public override LanguagePreferences GetLanguagePreferences()
        {
            if(preferences == null)
            {
                preferences = new LanguagePreferences(this.Site, typeof(SystemVerilogLanguageService).GUID, this.Name);
                preferences.Init();
                preferences.EnableCommenting = true;
                preferences.EnableFormatSelection = true;
            }
            return preferences;
        }

        public override IScanner GetScanner(IVsTextLines buffer)
        {
            if(scanner == null)
            {
                scanner = new SystemVerilogScanner(buffer);
            }
            return scanner;
        }

        public override string Name
        {
            get { return "SystemVerilog"; }
        }

        public override ParseRequest CreateParseRequest(Source s, int line, int idx, TokenInfo info, string sourceText, string fname, ParseReason reason, IVsTextView view)
        {
            lock(sources)
                sources[fname] = (SystemVerilogSource)s;
            return base.CreateParseRequest(s, line, idx, info, sourceText, fname, reason, view);
        }

        public override Source CreateSource(IVsTextLines buffer)
        {
            return new SystemVerilogSource(this, buffer);
        }

        public override AuthoringScope ParseSource(ParseRequest req)
        {
            if(req.Reason == ParseReason.Check || req.Reason == ParseReason.None)
            {
                // Parse the entire source as given in req.Text. Store results in the MyAuthoringScope object.
                SystemVerilogSource source;
                lock(sources)
                    source = sources[req.FileName];
                source.Parse(req.Text);
            }
            return new NullAuthoringScope();
        }
    }
}
