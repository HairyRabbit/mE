module Home.Model (Model, initModel) where

{-| Model

首页热点文章

-}

import Post.Model exposing (Post, initPost)



type alias Model =
  { post : Post
  }


initModel : Model
initModel =
  { post = initPost
  }
