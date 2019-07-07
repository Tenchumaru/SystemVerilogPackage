// Run this on the parser.y file that mksvgrmr creates with the standard error
// output of win_bison.

var nl = '\r\n';

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
  var args = WScript.Arguments, l = args.length, fin;
  if(l < 1 || l > 2) {
    WScript.Echo('usage:', WScript.FullScriptPath, 'parser.y [bison_warnings.txt]');
    WScript.Quit(2);
  }
  if(l === 2) {
    fin = fso.OpenTextFile(args(1), 1, false, 0);
  } else {
    fin = WScript.StdIn;
  }
  return { fileName: args(0), input: fin };
}

var fso = WScript.CreateObject('Scripting.FileSystemObject');

function ReadAllLines(fileName) {
  var fin = fso.OpenTextFile(fileName, 1, false, 0);
  var lines = [];
  while(!fin.AtEndOfStream) {
    lines.push(fin.ReadLine());
  }
  return lines;
}

function Main() {
  var args, lines, match, text, fout, i, n;
  args = ParseArguments();
  var rx = new RegExp('^' + args.fileName.replace('\\', '..') + ':([0-9]+).*rule useless');
  lines = ReadAllLines(args.fileName);
  while(!args.input.AtEndOfStream) {
    match = rx.exec(args.input.ReadLine());
    if(match) {
      i = Number(match[1]) - 1;
      text = lines[i];
      n = text.indexOf('{');
      if(~n) {
        lines[i] = text.substr(0, n) + '/* ' + text.substr(n) + ' -- ignore */';
      } else {
        lines[i] += ' /* ignore */';
      }
    }
  }
  fout = fso.CreateTextFile(args.fileName);
  for(i = 0, n = lines.length; i < n; ++i) {
    fout.WriteLine(lines[i]);
  }
  fout.Close();
}

Main();
