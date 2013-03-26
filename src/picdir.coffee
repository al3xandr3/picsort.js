
_ = require "underscore"

fs = require("fs")

walk = (dir, done) ->
  results = []
  fs.readdir dir, (err, list) ->
    return done(err)  if err
    i = 0
    (next = ->
      file = list[i++]
      return done(null, results)  unless file
      file = dir + "/" + file
      fs.stat file, (err, stat) ->
        if stat and stat.isDirectory()
          #walk file, (err, res) ->
          #  results = results.concat(res)
          #  next()
          results.push file
          next()
        else
          results.push file
          next()
    )()

# create html for the dis list
picdir_list = (path, fn) ->

  picHTML = (fl) ->
    stats = fs.lstatSync(fl)
    if stats.isDirectory()
      "<div><a class='dir' data-dir='#{fl}'><img src='vendor/img/folder.png' height='50' />#{fl}</a></div>"
    else
      if ['jpg', 'JPG', 'png'].indexOf(fl.split('.')[1]) > -1
        "<div><img class='image' id='#{encodeURIComponent(fl)}' src='#{fl}' /></div>"
      else 
        ""

  walk path, (err, results) ->
    throw err if err
    fn (_.reduce results, ((memo, fl) -> memo + picHTML(fl)), "")

# coffee src/picdir.coffee
# picdir_list "C:/zip/pics/a", (i) -> console.log i

root = exports ? this
root.picdir_list = picdir_list


