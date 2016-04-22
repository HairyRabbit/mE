###
Bootstrapper.
###

require "./main.styl"

Elm  = require "./Application/Main"
hljs = require "highlight.js/lib/index.js"


# Load theme.
themes = ["red", "blue", "green"]
genrd  = Math.floor Math.random() * themes.length
require "./Style/Theme/#{themes[genrd]}"


# Export highlight.
window.hljs = hljs
hljs.initHighlightingOnLoad 0


# Bootstrap App.
elm = Elm.fullscreen Elm.Main
