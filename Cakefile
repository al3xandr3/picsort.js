{spawn, exec} = require "child_process"

print = console.log

cmd = (command) ->
	child = exec command, (err, stdout, stderr) ->
    if err?
      console.error "Error :"
      console.dir   err
      console.log stdout
      console.error stderr
    else
      console.log command + " - done!"

task 'build', 'Compile coffee scripts into plain Javascript files', ->
  cmd 'coffee -c -j src/main.js src/exif.coffee src/picdir.coffee src/picsort.coffee'

task 'run', 'run picsort', ->
  invoke 'build'
  exec "rm -f picsort2.nw", (err, stdout, stderr) -> 
    if not err?
      exec "7z a picsort2.zip *.* -r", (err, stdout, stderr) -> 
        if not err?
          exec "mv picsort2.zip picsort2.nw", (err, stdout, stderr) -> 
            if not err?
              exec "nw picsort2.nw", (err, stdout, stderr) -> 
                if not err?
                  print "done!"
