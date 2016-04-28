###

Webpack plugins.

* HtmlWebpackPlugin   - Generate index page. @todos
* LoaderOptionsPlugin - Loader options.
* UglifyJsPlugin      - Minimize javascript.
* CommonsChunkPlugin  - Package common chunk.

###


webpack           = require "webpack"
HtmlWebpackPlugin = require "html-webpack-plugin"


loaderOptions =
  new webpack.LoaderOptionsPlugin
    minimize: true
    debug:    false

uglifyJs =
  new webpack.optimize.UglifyJsPlugin
    compress: warnings: false
    output:   comments: false
    sourceMap: false

commonsChunk =
  new webpack.optimize.CommonsChunkPlugin
    name:      "vendor"
    minChunks: Infinity
    filename:  "vendor.js"

htmlWebpack =
  new HtmlWebpackPlugin
    title:    "HJ"
    template: "./index.jade"



plugins = (env) ->
  if env is "development"

  then [ commonsChunk
       , htmlWebpack
       ]

  else [ loaderOptions
       , uglifyJs
       , commonsChunk
       , htmlWebpack
       ]



module.exports = plugins
