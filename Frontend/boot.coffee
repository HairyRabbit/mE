###
Bootstrapper.
###

require "./glob"
require "highlight.js/styles/tomorrow.css"

Elm  = require "./Application/Main"
hljs = require "highlight.js/lib/index.js"


# Load theme.
themes = ["red", "blue"]
genrd  = Math.floor Math.random() * themes.length
require "./Style/Theme/#{themes[genrd]}"


# elm = Elm.fullscreen Elm.Main, path: trimPath
elm = Elm.fullscreen Elm.Main


# Export highlight.
window.hljs = hljs
hljs.initHighlightingOnLoad 0
