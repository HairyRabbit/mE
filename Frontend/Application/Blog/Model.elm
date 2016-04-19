module Blog.Model (Model, initModel) where

{-| Model

博客文章

* post    文章信息
* content markdown 内容

-}

import Post.Model exposing (Post, initPost)



type alias Model =
  { post    : Post
  , content : String
  }


initModel : Model
initModel =
  { post    = initPost
  , content = ""
  }
