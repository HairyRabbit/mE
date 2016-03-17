webpack          = require "webpack"
WebpackDevServer = require "webpack-dev-server"
path             = require "path"


# Webpack configs.
loaders  = [
  test:    /\.elm$/
  exclude: [/elm-stuff/, /node_modules/]
  loader:  "elm-hot!elm-webpack"
,
  test:    /\.coffee$/
  loader:  "coffee"
]
config   =
  entry:        "./Application/boot"
  output:
    path:       path.resolve __dirname, 'dist/'
    filename:   "bundle.js"
  module:
    loaders:    loaders
  resolve:
    extensions: [".elm", ".coffee"]
setting  =
  hot:      true
  inlien:   true
  progress: true


# Construct dev server.
compiler = webpack config
server   = new WebpackDevServer compiler, setting


# Server setting.
host     = "localhost"
port     = 8080
log      = console.log
handle   = -> log "\nServer listening at https://#{host}:#{port}\n"


# Main call.
main     = -> server.listen port, host, handle
main 0
