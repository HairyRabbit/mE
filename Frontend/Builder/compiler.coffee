###

Webpack config compiler.

###


webpack = require "webpack"
path    = require "path"
loaders = require "./loaders"
plugins = require "./plugins"
resolve = require "./resolve"
postcss = require "./postcss"

config = (env) ->
  entry:
    app: "./main"
    vendor: ["highlight.js/lib/index.js"]
  output:
    path: path.resolve __dirname, '../Dist/'
    filename: "[name].js"
  module: loaders: loaders
  postcss: postcss
  plugins: plugins env
  resolve: resolve
  cache: true


module.exports = (env) -> webpack config env
