module Blogs.Init where

import Effects exposing (Effects)
import Blogs.Action exposing (Action(..))
import Blogs.Model  exposing (Model, initModel)
import Blogs.Effects exposing (fetchPosts)

init : (Model, Effects Action)
init =
  (initModel, fetchPosts)
