module View where

import Html exposing (..)
import Action exposing (Action(..))
import Model exposing (Model)
import Router.View as Router

view : Signal.Address Action -> Model -> Html
view address model =
  div [] [ Router.view (Signal.forwardTo address ActionRouter) model.router ]
