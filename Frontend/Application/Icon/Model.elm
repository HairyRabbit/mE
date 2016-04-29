{- mode: Elm -}
{- coding: utf-8 -}
module Icon.Model where

{-| Model

图标

-}

type alias Icon =
  { name : String
  , href : String
  , path : String
  }


type alias Lang =
  { name : String
  , href : String
  }


nodejs : Icon
nodejs =
  { name = "nodejs"
  , href = "https://nodejs.org"
  , path = "nodejs"
  }

javascript : Icon
javascript =
  { name = "javascript"
  , href = "https://developer.mozilla.org/zh-CN/docs/Web/JavaScript"
  , path = "javascript"
  }

es6 : Icon
es6 =
  { name = "es6"
  , href = "http://babeljs.io/docs/learn-es2015/"
  , path = "es6"
  }

icons : List Icon
icons =
  [ nodejs
  , javascript
  , es6
  ]
