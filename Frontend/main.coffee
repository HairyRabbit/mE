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

test = -> require "./Style/animate.styl"
setTimeout test, 1000


# Export highlight.
window.hljs = hljs
hljs.initHighlightingOnLoad 0


# Bootstrap App.
elm = Elm.fullscreen Elm.Main


# Page routing animation.
initAnimate = ->
  node = document.querySelector "main"
  node.classList.add "anim"
  node.classList.add "anim-home"

elm.ports.routing.subscribe -> setTimeout initAnimate, 500
