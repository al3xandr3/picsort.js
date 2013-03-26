
{spawn, exec} = require "child_process"

exif = (path, fn) ->
	et = spawn("vendor\\bin\\exiftool.exe ", ["-j", "-sort", path])
	res = ""
	err = ""
	hasErr = false
	
	et.stdout.on "data", (data) ->
	  res += data

	et.stderr.on "data", (data) ->
	  err += data
	  hasErr = true

	et.on "exit", (code) ->
	  if hasErr and code isnt 0
	    err = "Exiftool exited with code: " + code  if err.length is 0
	    fn new Error(err)
	  else
	  	try
	    	json = res.toString()
	    	fn null, JSON.parse(json)
	    catch error
    		fn null, ""

#if require.main == module
#exif "C:/zip/pics", (err, data) -> console.log data

root = exports ? this
root.exif = exif