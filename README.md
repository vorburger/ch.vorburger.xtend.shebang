= #!xtend Script

This project IS A DREAM (spec) TO MAYBE allow (xtend-lang.org)Xtend to be used for scripting, like this:

Install #!xtend one time as follows: 

   $ wget .. raw.gitub.../xtend >~/bin
   $ chmod +x ~/bin/xtend


Main.xtend:
   $ xtend demo/Main.xtend
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
* make all of above work! ;-)
* tests/ based on ch.vorburger.exec run above
* allow #! as // in *.xtend and *.xtends => *.xtend, or new Xbase DSL?
* CLI commands, using that library from minecraft
* REST API web server built-in
* web editor: xtend-web *.xtends -> open browser!
* generate this README; fixed text, and program execution from live run
* CLI commands with man-like --help
* CLI commands syntax completion
* make ./xtend script very short, contain almost nothing, and delegate to HTTP DL'd auto-update/able real impl

