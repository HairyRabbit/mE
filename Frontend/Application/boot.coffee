# Bootstrapper
Style = require "./glob"
Elm   = require "./Main"

path  = location.pathname
elm   = Elm.fullscreen Elm.Main, path: path
