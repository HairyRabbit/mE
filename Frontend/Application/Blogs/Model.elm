module Blogs.Model (Model, initModel) where

{-| Model

博客文章列表

* posts   文章集合
* current 当前页码
* size    每页显示条数

-}

import Post.Model exposing (Post)



type alias Model =
  { posts     : List Post
  , current   : Int
  , size      : Int
  }


initModel : Model
initModel =
  { posts     = []
  , current   = 0
  , size      = 5
  }
