module Home.Init (init) where

{-| Init

文章博客列表，什么都不做

-}

import Effects      exposing (Effects)
import Home.Action  exposing (Action(..))
import Home.Model   exposing (Model, initModel)



init : (Model, Effects Action)
init =
  (initModel, Effects.none)
