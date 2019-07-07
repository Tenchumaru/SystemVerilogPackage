using System.IO;
using System.Linq;

namespace mksvgrmr
{
    partial class Program
    {
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

            CreateParser(args, text);
        }
    }
}
