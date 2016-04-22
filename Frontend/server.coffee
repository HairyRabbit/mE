###
# Server
###

webpack          = require "webpack"
WebpackDevServer = require "webpack-dev-server"
compiler         = require "./Builder/compiler"

# WebpackDevServer configs
#
# Supports:
#
# * hot reload
# * history api fall back
#
config =
  entry:
    app: "./boot"
    vendor: ["highlight.js/lib/index.js"]
  output:
    path: './Dist'
    filename: "[name].js"
  module: loaders: loaders
  postcss: postcss
  plugins: plugins
  resolve: resolve
setting  =
  hot: true
  inlien: true
  progress: true
  proxy:
    "/api/*": "http://localhost:4000/"
  historyApiFallback:
    index: '/'
  stats:
    colors: true
  headers:
    "X-Custom-Header": "yes"

server = new WebpackDevServer compiler, setting


# Server setting.
host     = "localhost"
port     = 2333
handle   = -> console.log "\nServer listening at https://#{host}:#{port}\n"


# Main call.
main     = -> server.listen port, host, handle
main 0
