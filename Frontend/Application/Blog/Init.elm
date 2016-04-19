module Blog.Init (init) where

{-| Init

文章博客，什么都不做

-}

import Effects     exposing (Effects)
import Blog.Action exposing (Action(..))
import Blog.Model  exposing (Model, initModel)



init : (Model, Effects Action)
init =
  (initModel, Effects.none)
