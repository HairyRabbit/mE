###
# Server
###

webpack          = require "webpack"
WebpackDevServer = require "webpack-dev-server"
path             = require "path"
HandlebarsPlugin = require "handlebars-webpack-plugin"
short            = require "postcss-short"


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
  test:    /\.css$/,
  loader:  "style!css"
,
  test:    /\.otf$/,
  loader:  "url"
,
  test:    /\.styl$/,
  exclude: [/node_modules/]
  loader:  "style!css!postcss!stylus"
]
plugins  = [
  new HandlebarsPlugin
    entry:      "./index.hbs"
    output:     "./index.html"
    partials:   []
]
roots    = [
  path.resolve('./node_modules/highlight.js/lib')
]
config   =
  entry:
    app:        "./boot"
  output:
    path:       path.resolve __dirname, 'dist/'
    filename:   "[name].js"
  module:
    loaders:    loaders
  postcss:      [short()]
  plugins:      plugins
  resolve:
    extensions: ["", ".js", ".elm", ".coffee", ".styl"]
    root:       roots

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
