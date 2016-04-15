###
Bootstrapper.
###

require "./glob"
require "highlight.js/styles/tomorrow.css"
Elm   = require "./Application/Main"
hljs  = require "highlight.js/lib/index.js"


path        = location.pathname
isHomePath  = path is "/"
needFmtPath = path.slice(-1) is "/"
fmtPath     = path.slice 0, -1
trimPath    = if not isHomePath and needFmtPath then fmtPath else path

# Call main func as Fullscreen.
# elm = Elm.fullscreen Elm.Main, path: trimPath
elm = Elm.fullscreen Elm.Main

# Export highlight.
window.hljs = hljs
hljs.initHighlightingOnLoad 0
