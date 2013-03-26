
fs = require "fs"

# {exif} = require "./exif"

p = console.log

byday = (path) ->
  exif path, (err, data) ->
    _.each data, (pic) -> 

      # get date
      fl   = pic['SourceFile']
      date = pic['DateTimeOriginal'] || pic['FileModifyDate']
      dte =  path + '/'+ date.split(' ')[0].replace(/:/g, "-")

      # create dir
      fs.stat dte, (err, stat) ->
        if not stat
          fs.mkdir dte

      # move picture
      _fl = fl.split("/")
      #p fl," : ", dte + "/" + (_fl[_fl.length - 1])
      fs.rename fl, dte + "/" + (_fl[_fl.length - 1])

#byday("C:/zip/pics")

root = exports ? this
root.byday = byday
