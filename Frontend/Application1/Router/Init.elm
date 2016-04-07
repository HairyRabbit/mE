module Router.Init where

import Effects exposing (Effects)
import Router.Action exposing (Action(..))
import Router.Model exposing (Model, pathToPage)

init : String -> (Model, Effects Action)
init path =
  ( { page = pathToPage path }
  , Effects.none
  )
