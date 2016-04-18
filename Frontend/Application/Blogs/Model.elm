module Blogs.Model where

import Post.Model exposing (Post)



type alias Model =
  { posts     : List Post
  , currPosts : List Post
  , current   : Int
  , size      : Int
  }


initModel : Model
initModel =
  { posts     = []
  , currPosts = []
  , current   = 0
  , size      = 5
  }
