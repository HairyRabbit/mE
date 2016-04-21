webpack = require "webpack"
HtmlWebpackPlugin = require "html-webpack-plugin"

module.exports = [
  new webpack.LoaderOptionsPlugin
    minimize: true
    debug: false
  new webpack.optimize.UglifyJsPlugin
    compress: warnings: false
    output: comments: false
    sourceMap: false
  new webpack.optimize.CommonsChunkPlugin
    name: "vendor"
    minChunks: Infinity
    filename: "vendor.bundle.js"
  new HtmlWebpackPlugin
    title: "HJ"
    template: "./index.jade"
]
