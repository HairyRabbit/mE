###
# Server
###

webpack          = require "webpack"
path             = require "path"
loaders          = require "./loaders"
plugins          = require "./plugins"
resolve          = require "./resolve"
postcss          = require "./postcss"

config   =
  entry:
    app:      "./boot"
    vendor:   ["highlight.js/lib/index.js"]
  output:
    path:     './Dist'
    filename: "[name].js"
  module: loaders: loaders
  postcss: postcss
  plugins: plugins
  resolve: resolve


# Construct dev server.
module.exports = webpack config
