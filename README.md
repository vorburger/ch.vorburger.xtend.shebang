= #!xtend Script (AKA ch.vorburger.xtend.shebang)

This project IS A DREAM (spec) TO MAYBE allow (xtend-lang.org)Xtend to be used for scripting, like this:

TODO video


Here are step-by-step instructions for what the video above demonstrates:

Install #!xtend one time as follows: 

   $ wget .. raw.gitub.../xtend >~/bin
   $ chmod +x ~/bin/xtend


Main.xtend:
   $ ./xtend demo/Main.xtend
   hello, world


We can also use she-bang magic to call our script directly instead of via wrapper:

hello.xtends:
?include demo/hello.xtends
   $ ./hello.xtends
   hello, world


We don't actually need the *.xtends file extension, this works just fine as well:

hello:
?include demo/hello
   $ ./hello
   hello, world


We can pass arguments into the script:

hello2:
?include demo/hello2
   $ ./hello2 you
   hello, you


We can run a web server:

?include demo/index
   $ index --server
   HTTP server now running on http://localhost:5050 ... Ctrl-D to shut down.
   $ http http://localhost:5050
   <html><body>hello, world</body></html>

We can define sub-commands in the script:

?include demo/cool
   $ cool thing
   thing
   $ cool thang 3
   1 2 3
   $ cool --help
   USAGE: cool 
               thing
                      Prints a thing.
               thang
                      Counts to n.


We get a REST API server for free:

   $ ./cool --server
   cool REST API server now running on http://localhost:2973/cool
   $ http GET http://localhost:2973/cool/thing
   thing
   $ http POST http://localhost:2973/cool/thang { n: 3 }
   1 2 3


We can cross in and out of scripts and regular Xtend and Java, to call out into other Xtend scripts, Xtend classes, either way:

?include demo/Util.xtend
   $ callutil
   thing


We can even make a single simple script file depend on any Java library:

?include demo/calllib.xtends
   $ calllib
   TODO


== TODO

* install/gradle/wrapper/* created by gradle --wrapper
* try it simply ./xtend demo/Util.xtend
* make a https://asciinema.org
* allow #! as // in *.xtend, at least in first line, see https://en.wikipedia.org/wiki/Shebang_(Unix)  (and so *.xtends => *.xtend, NOT or new Xbase DSL)
* POC class ch.vorburger.xtend.shebang.lib.Main, with xtend bash calling that instead and just pass arg, so that args and --server and --ide handled can be handled in Java instead shell
* POC double indirection? xtend: #!/usr/bin/env ch.vorburger.xtend.shebang.Main which is itself a Xtend script, to chop off first line, auto-update, handle args, etc.
* make ./xtend script very short, contain almost nothing, and delegate to HTTP DL'd auto-update/able real impl
* tests/ based on ch.vorburger.exec run above
* make all of above work! ;-)
* CLI commands, using that library from minecraft
* demo/index.xtend web server (not yet REST API)
* HoTea support in web server, based on gradle --continuous
* REST API web server built-in
* web editor: xtend-web *.xtends -> open browser!
* generate this README; fixed text, and program execution from live run
* automatically re-generate the asciicinema screencast from above
* CLI commands with man-like --help
* CLI commands syntax completion; e.g. for zsh, how to?
* https://www.eclipse.org/forums/index.php/t/689396/
