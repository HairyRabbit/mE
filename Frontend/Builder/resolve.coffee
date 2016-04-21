path = require "path"

module.exports =
  extensions: [
    "", ".js", ".coffee",
    ".elm", ".styl"
  ]
  root: [
    path.resolve "./node_modules/highlight.js/lib"
  ]
