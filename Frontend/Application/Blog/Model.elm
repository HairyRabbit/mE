module Blog.Model where

import Post.Model exposing (Post, initPost)

{-| Blog Model

定义了Blog的模型。

-}

-- 文章ID
type alias Model =
  { post    : Post
  , content : String
  }

initModel : Model
initModel =
  { post    = initPost
  , content = ""
  }
