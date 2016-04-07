module Posts.Action where

import Posts.Model exposing (Model)

type Action
  = NoOp
  | NewPosts (Maybe Model)
