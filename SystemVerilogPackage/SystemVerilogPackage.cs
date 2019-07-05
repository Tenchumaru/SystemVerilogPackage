using System;
using System.ComponentModel.Design;
using System.Diagnostics;
using System.Globalization;
using System.Runtime.InteropServices;
using Microsoft.VisualStudio;
using Microsoft.VisualStudio.OLE.Interop;
using Microsoft.VisualStudio.Package;
using Microsoft.VisualStudio.Shell;
using Microsoft.VisualStudio.Shell.Interop;
using Microsoft.Win32;

namespace Adrezdi.SystemVerilogPackage
{
    /// <summary>
    /// This is the class that implements the package exposed by this assembly.
    ///
    /// The minimum requirement for a class to be considered a valid package for Visual Studio
    /// is to implement the IVsPackage interface and register itself with the shell.
    /// This package uses the helper classes defined inside the Managed Package Framework (MPF)
    /// to do it: it derives from the Package class that provides the implementation of the 
    /// IVsPackage interface and uses the registration attributes defined in the framework to 
    /// register itself and its components with the shell.
    /// </summary>
    // This attribute tells the PkgDef creation utility (CreatePkgDef.exe) that this class is
    // a package.
    [PackageRegistration(UseManagedResourcesOnly = true)]
    // This attribute is used to register the information needed to show this package
    // in the Help/About dialog of Visual Studio.
    [InstalledProductRegistration("#110", "#112", "1.0", IconResourceID = 400)]
    [Guid(GuidList.guidSystemVerilogPackagePkgString)]
    [ProvideService(typeof(SystemVerilogLanguageService), ServiceName = "SystemVerilog Language Service")]
    [ProvideLanguageService(typeof(SystemVerilogLanguageService),
        "SystemVerilog",
        106,             // resource ID of localized language name
        //CodeSense = true,             // Supports IntelliSense
        CodeSense = false,
        //RequestStockColors = false,   // Supplies custom colors
        RequestStockColors = true,
        EnableCommenting = true,       // Supports commenting out code
        EnableAsyncCompletion = true,  // Supports background parsing
        EnableFormatSelection = true
        )]
    [ProvideLanguageExtension(typeof(SystemVerilogLanguageService), ".sv")]
    public sealed class SystemVerilogPackage : Package, IOleComponent
    {
        private uint componentId;

        /// <summary>
        /// Default constructor of the package.
        /// Inside this method you can place any initialization code that does not require 
        /// any Visual Studio service because at this point the package object is created but 
        /// not sited yet inside Visual Studio environment. The place to do all the other 
        /// initialization is the Initialize method.
        /// </summary>
        public SystemVerilogPackage()
        {
            Debug.WriteLine(string.Format(CultureInfo.CurrentCulture, "Entering constructor for: {0}", this.ToString()));
        }



        /////////////////////////////////////////////////////////////////////////////
        // Overridden Package Implementation

        /// <summary>
        /// Initialization of the package; this method is called right after the package is sited, so this is the place
        /// where you can put all the initialization code that rely on services provided by VisualStudio.
        /// </summary>
        protected override void Initialize()
        {
            Debug.WriteLine(string.Format(CultureInfo.CurrentCulture, "Entering Initialize() of: {0}", this.ToString()));
            base.Initialize();

            // Proffer the service.
            var serviceContainer = (IServiceContainer)this;
#if true
            ServiceCreatorCallback fn = (c, t) =>
            {
                if(c == this && typeof(SystemVerilogLanguageService) == t)
                {
                    var service = new SystemVerilogLanguageService();
                    service.SetSite(this);
                    return service;
                }
                return null;
            };
            serviceContainer.AddService(typeof(SystemVerilogLanguageService), fn, true);
#else
            var service = new SystemVerilogLanguageService();
            service.SetSite(this);
            serviceContainer.AddService(typeof(SystemVerilogLanguageService), service, true);
#endif

            // Register a timer to call our language service during
            // idle periods.
            var mgr = GetService(typeof(SOleComponentManager)) as IOleComponentManager;
            if(componentId == 0 && mgr != null)
            {
                OLECRINFO[] crinfo = new OLECRINFO[1];
                crinfo[0].cbSize = (uint)Marshal.SizeOf(typeof(OLECRINFO));
                crinfo[0].grfcrf = (uint)_OLECRF.olecrfNeedIdleTime |
                                              (uint)_OLECRF.olecrfNeedPeriodicIdleTime;
                crinfo[0].grfcadvf = (uint)_OLECADVF.olecadvfModal |
                                              (uint)_OLECADVF.olecadvfRedrawOff |
                                              (uint)_OLECADVF.olecadvfWarningsOff;
                crinfo[0].uIdleTimeInterval = 1000;
                int hr = mgr.FRegisterComponent(this, crinfo, out componentId);
            }
        }

        protected override void Dispose(bool disposing)
        {
            if(componentId != 0)
            {
                var mgr = GetService(typeof(SOleComponentManager)) as IOleComponentManager;
                if(mgr != null)
                {
                    int hr = mgr.FRevokeComponent(componentId);
                }
                componentId = 0;
            }

            base.Dispose(disposing);
        }

        public int FDoIdle(uint grfidlef)
        {
            bool bPeriodic = (grfidlef & (uint)_OLEIDLEF.oleidlefPeriodic) != 0;
            // Use typeof(TestLanguageService) because we need to
            // reference the GUID for our language service.
            var service = GetService(typeof(SystemVerilogLanguageService)) as LanguageService;
            if(service != null)
            {
                service.OnIdle(bPeriodic);
            }
            return 0;
        }

        public int FContinueMessageLoop(uint uReason,
                                        IntPtr pvLoopData,
                                        MSG[] pMsgPeeked)
        {
            return 1;
        }

        public int FPreTranslateMessage(MSG[] pMsg)
        {
            return 0;
        }

        public int FQueryTerminate(int fPromptUser)
        {
            return 1;
        }

        public int FReserved1(uint dwReserved,
                              uint message,
                              IntPtr wParam,
                              IntPtr lParam)
        {
            return 1;
        }

        public IntPtr HwndGetWindow(uint dwWhich, uint dwReserved)
        {
            return IntPtr.Zero;
        }

        public void OnActivationChange(IOleComponent pic,
                                       int fSameComponent,
                                       OLECRINFO[] pcrinfo,
                                       int fHostIsActivating,
                                       OLECHOSTINFO[] pchostinfo,
                                       uint dwReserved)
        {
        }

        public void OnAppActivate(int fActive, uint dwOtherThreadID)
        {
        }

        public void OnEnterState(uint uStateID, int fEnter)
        {
        }

        public void OnLoseActivation()
        {
        }

        public void Terminate()
        {
        }
    }
}
