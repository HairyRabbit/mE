###

Developer server.

###

webpack          = require "webpack"
WebpackDevServer = require "webpack-dev-server"
compiler         = require "./compiler"


setting  =
  hot:      true
  inlien:   true
  progress: true
  historyApiFallback: index: '/'
  stats: colors: true


server = new WebpackDevServer compiler "development", setting


# Server setting.
host     = "localhost"
port     = 2333
handle   = -> console.log """
  \nServer listening at https://#{host}:#{port}\n
"""


# Main call.
main = -> server.listen port, host, handle



main()
