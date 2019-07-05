// Guids.cs
// MUST match guids.h
using System;

namespace Adrezdi.SystemVerilogPackage
{
    static internal class GuidList
    {
        public const string guidSystemVerilogPackagePkgString = "b8d55256-7be3-4105-bf88-7bcfc141e908";
        public const string guidSystemVerilogPackageCmdSetString = "d8f123ac-a453-48b8-9a01-4c862b0d9da8";
        public const string SystemVerilogLanguage = "bcbce31a-b18b-4d04-bd9c-f4e32675f38c";

        public static readonly Guid guidSystemVerilogPackageCmdSet = new Guid(guidSystemVerilogPackageCmdSetString);
    };
}