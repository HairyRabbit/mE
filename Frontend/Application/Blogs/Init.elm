module Blogs.Init (init) where

{-| Init

文章博客列表，什么都不做

-}

import Effects      exposing (Effects)
import Blogs.Action exposing (Action(..))
import Blogs.Model  exposing (Model, initModel)

init : (Model, Effects Action)
init =
  (initModel, Effects.none)
