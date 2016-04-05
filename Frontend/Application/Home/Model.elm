module Home.Model where

{-
import Hotspot.Model as Hotspot


type alias Model =
  { hotspot : Hotspot.Model
  }

initModel : Model
initModel =
  { hotspot = Hotspot.initModel
  }
-}


import Post

type alias Model =
  { posts : Post.Model }

initModel : Model
initModel =
  { posts = [] }
