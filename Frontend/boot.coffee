###
Bootstrapper.
###

Style = require "./glob"
Elm   = require "./Application/Main"

path        = location.pathname
isHomePath  = path is "/"
needFmtPath = path.slice(-1) is "/"
fmtPath     = path.slice 0, -1
trimPath    = if not isHomePath and needFmtPath then fmtPath else path

# Call main func as Fullscreen.
elm = Elm.fullscreen Elm.Main, path: trimPath
