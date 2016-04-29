###

Webpack loaders.

###

module.exports = [
  test: /\.elm$/
  exclude: [/elm-stuff/, /node_modules/]
  loader: "elm-hot!elm-webpack?cwd=./"
,
  test: /\.coffee$/
  loader: "coffee"
,
  test: /\.css$/
  loader: "style!css"
,
  test: /\.otf$/
  loader: "url"
,
  test: /\.styl$/
  exclude: [/node_modules/]
  loader: "style!css!postcss!stylus"
,
  test: /\.jade$/
  loader: "jade"
,
  test: /\.json$/
  loader: "json"
,
  test: /\.toml$/
  loader: "toml"
]
