module Post.Action where

import Post.Model exposing (Model)

type Action
  = NoOp
  | NewPost (Maybe Model)
