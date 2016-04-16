module Blog.Model where

{-| Blog Model

定义了Blog的模型。

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
