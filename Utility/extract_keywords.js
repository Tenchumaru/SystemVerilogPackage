// Run this on the HTML found at
// http://www.vhdl.org/sv-ec/annexA_bnf_3_1_final.html

var nl = "\r\n";

if(!Array.prototype.filter) {
  Array.prototype.filter = function(fn) {
    var i, n = this.length, rv = [];
    for(i = 0; i < n; ++i) {
      var el = this[i];
      if(fn(el))
        rv.push(el);
    }
    return rv;
  };
}

if(!String.prototype.trim) {
  String.prototype.trim = function(ch) {
    var begin = new RegExp('^' + (ch ? ch : "[\\s]+"));
    var end = new RegExp((ch ? ch : "[\\s]+") + '$');
    return this.replace(begin, "").replace(end, "");
  };
}

function ParseArguments() {
  var args = WScript.Arguments, l = args.length;
  if(l < 1 || l > 2) {
    WScript.Echo("usage:", WScript.FullScriptPath, "input.html [output.txt]");
    WScript.Quit(2);
  }
  return { input: args(0), output: l > 1 && args(1) };
}

var fso = WScript.CreateObject("Scripting.FileSystemObject");

function ReadAllText(fileName) {
  var fin = fso.OpenTextFile(fileName, 1, false, 0);
  var text = fin.ReadAll();
  if(fileName || WScript.Arguments.length > 0)
    fin.Close();
  return text;
}

function Main() {
  var args, fin, text, parts, dict, i, n, line, fout, print;

  args = ParseArguments();

  fin = fso.OpenTextFile(args.input, 1, false, 0);
  text = fin.ReadAll();
  fin.Close();

  fout = args.output ? fso.CreateTextFile(args.output) : WScript.StdOut;
  print = function() {
    var i, n, ar = [];
    for(i = 0, n = arguments.length; i < n; ++i)
      ar.push(arguments[i]);
    fout.WriteLine(ar.join(' '));
  };

  parts = text.split("BNFkeyword");
  dict = {};
  for(i = 0, n = parts.length; i < n; i++) {
    line = parts[i].split(">")[1].split("<")[0].trim();
    if(line.length > 1 && !dict[line]) {
      print(line);
      dict[line] = true;
    }
  }

  fout.Close();
}

Main();
