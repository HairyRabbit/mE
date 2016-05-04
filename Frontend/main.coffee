###

Application bootstrapper.

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
profile = require "./profile"
icon    = require "./icon"
ports   =
  contacts: profile.contacts
  props:    profile.props
  me:       profile.me
  langs:    icon.lang

elm = Elm.fullscreen Elm.Main, ports


# Page routing animation.
initAnimate = ->
  node = document.querySelector "main"
  node.classList.add "anim"

elm.ports.routing.subscribe -> setTimeout initAnimate, 300


# Hack for elm model
showModel = (model) -> console.log model
elm.ports.model.subscribe showModel
