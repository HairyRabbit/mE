module Blog.View where

import Blog.Action exposing (Action(..))
import Blog.Model  exposing (Model)

init : (Model, Effects Action)
init =
  (model, Effects.none)
