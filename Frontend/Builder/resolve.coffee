path = require "path"

module.exports =
  extensions: [
    "",
    ".js",
    ".json",
    ".coffee",
    ".elm",
    ".styl"
  ]
  root: [
    path.resolve "./node_modules/highlight.js/lib"
  ]
