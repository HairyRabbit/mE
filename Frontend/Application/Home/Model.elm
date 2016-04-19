module Home.Model where

import Post.Model exposing (Post, initPost)



type alias Model =
  { post : Post
  }


initModel : Model
initModel =
  { post = initPost
  }
