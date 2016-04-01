###
# Server
###

webpack          = require "webpack"
WebpackDevServer = require "webpack-dev-server"
path             = require "path"
HandlebarsPlugin = require "handlebars-webpack-plugin"


# Webpack configs.
#
# Loaders:
#
# * elm
# * coffee
# * style css stylus
#
# Plugins
#
# * handlebars
loaders  = [
  test:    /\.elm$/
  exclude: [/elm-stuff/, /node_modules/]
  loader:  "elm-hot!elm-webpack?cwd=./"
,
  test:    /\.coffee$/
  loader:  "coffee"
,
  test:    /\.styl$/,
  exclude: [/node_modules/]
  loader:  "style!css!stylus"
]
plugins  = [
  new HandlebarsPlugin
    entry:      "./index.hbs"
    output:     "./index.html"
    partials:   []
]
config   =
  entry:        "./boot"
  output:
    path:       path.resolve __dirname, 'dist/'
    filename:   "bundle.js"
  module:
    loaders:    loaders
  plugins:      plugins
  resolve:
    extensions: ["", ".elm", ".coffee", ".styl"]

# WebpackDevServer configs
#
# Supports:
#
# * hot reload
# * history api fall back
setting  =
  hot:      true
  inlien:   true
  progress: true
  proxy:
    "/api/*": "http://localhost:9090"
  historyApiFallback:
    index: '/'
  stats:
    colors: true


# Construct dev server.
compiler = webpack config
server   = new WebpackDevServer compiler, setting


# Server setting.
host     = "localhost"
port     = 2333
handle   = -> console.log "\nServer listening at https://#{host}:#{port}\n"


# Main call.
main     = -> server.listen port, host, handle
main 0
