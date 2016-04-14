module Blog.Init where

import Effects exposing (Effects)
import Blog.Action exposing (Action(..))
import Blog.Model  exposing (Model, initModel)
import Blog.Effects exposing (fetchPost)

init : (Model, Effects Action)
init =
  (initModel, fetchPost "123")
