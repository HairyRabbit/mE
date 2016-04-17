module Blogs.Model where

import Post.Model exposing (Post)



type alias Model =
  { posts   : List Post
  , current : Int
  }


initModel : Model
initModel =
  { posts   = []
  , current = 0
  }
