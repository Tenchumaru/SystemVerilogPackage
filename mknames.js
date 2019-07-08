// Run this on the parser.y file that mksvgrmr creates with the standard error
// output of win_bison.

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
    var begin = new RegExp('^' + (ch ? ch : '[\\s]+'));
    var end = new RegExp((ch ? ch : '[\\s]+') + '$');
    return this.replace(begin, '').replace(end, '');
  };
}

function ParseArguments() {
  var args = WScript.Arguments, l = args.length, fin, fout;
  if(l < 1 || l > 2) {
    WScript.Echo('usage:', WScript.FullScriptPath, 'parser.h [output.inl]');
    WScript.Quit(2);
  }
  fin = fso.OpenTextFile(args(0), 1, false, 0);
  if(l === 2) {
    fout = fso.CreateTextFile(args(1));
  } else {
    fout = WScript.StdOut;
  }
  return { input: fin, output: fout };
}

var fso = WScript.CreateObject('Scripting.FileSystemObject');

function Main() {
  var args, fin, fout, rx, line, match;
  args = ParseArguments();
  fin = args.input;
  fout = args.output;
  rx = /([^ ]+) = [0-9]+/;
  while(!fin.AtEndOfStream) {
    line = fin.ReadLine();
    match = rx.exec(line);
    if(match) {
      fout.WriteLine('"' + match[1] + '",');
    }
  }
  fout.Close();
  fin.Close();
}

Main();
