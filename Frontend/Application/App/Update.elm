module App.Update where

import Effects exposing (Effects)
import App.Action exposing (Action(..))
import App.Model exposing (Model)
import Routing.Update as Routing

import Debug

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RoutingAction act ->
      let
        (m, fx, fx2) = Routing.update act model
      in
        ( { model | routing = m }
        , [ Effects.map RoutingAction fx
          , Effects.map BlogAction fx2
          ] |> Effects.batch
        )
        

    _ ->
      (model, Effects.none)
