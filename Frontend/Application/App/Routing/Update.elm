module Routing.Update where

import Hop
import Hop.Navigate exposing (navigateTo)
import Routing.Action exposing (Action(..))
import Routing.Model exposing (Model)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NavigateTo path ->
      let
        effects =
          Effects.map HopAction <| navigateTo path
      in
        (model, effects)

    ApplyRoute (route, location) ->
      let
        m = { model |
              route = route
            , location = location
            }
      in
        (model, Effects.none)

    HopAction () ->
      (model, Effects.none)

