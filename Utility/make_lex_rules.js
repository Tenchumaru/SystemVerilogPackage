// Run this on parser.h.

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

if(!Array.prototype.some) {
  Array.prototype.some = function(fn) {
    var i, n = this.length, rv = [];
    for(i = 0; i < n; ++i) {
      var el = this[i];
      if(fn(el))
        return true;
    }
    return false;
  };
}

if(!Array.prototype.every) {
  Array.prototype.every = function(fn) {
    return !this.some(function(el) { return !fn(el); });
  };
}

if(!String.prototype.startsWith) {
  String.prototype.startsWith = function(s) {
    return s.length <= this.length && this.substr(0, s.length) === s;
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
    WScript.Echo("usage:", WScript.FullScriptPath, "parser.h [output.l]");
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
  var args, lines, fin, ignorables, spaces, line, fout, print, name, token;

  args = ParseArguments();
  lines = [];

  fin = fso.OpenTextFile(args.input, 1, false, 0);
  ignorables = ["THEN", "LSL", "LSR", "NEG", "GE", "LE", "EQ", "NEQ", "ID", "STRING", "VALUE", "OR", "AND", "ASL", "ASR", "OH_ARE", "POWER"];
  spaces = "                ";
  while(!fin.AtEndOfStream) {
    line = fin.ReadLine().trim();
    if(line.slice(-1) === ',' && line.indexOf('=') >= 0) {
      name = line.split(' ')[0];
      var ignored = ignorables.some(function(el) { return el === name; });
      if(!ignored) {
        token = (name.slice(-1) === '_' ? name.slice(0, -1) : name).toLowerCase();
        lines.push(token + spaces.slice(token.length) + "{ return DBOUT(" + name + ", Identifier); }");
      }
    }
  }
  lines.push("or" + spaces.slice(2) + "{ return DBOUT(OH_ARE, Identifier); }");
  fin.Close();

  var sortFn = function(left, right) {
    left = left.split(' ')[0];
    right = right.split(' ')[0];
    try {
      if(left.length > right.length)
        return -1;
      if(left.length < right.length)
        return 1;
      if(left < right)
        return -1;
      if(left > right)
        return 1;
    } catch(err) {
      // I have no idea why this happens.
    }
    return 0;
  };
  lines = lines.sort(sortFn);
  fout = args.output ? fso.CreateTextFile(args.output) : WScript.StdOut;
  fout.WriteLine(lines.join(nl));
  fout.Close();
}

Main();
