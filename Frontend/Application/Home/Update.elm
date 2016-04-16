module Home.Update where

import Effects      exposing (Effects)
import Home.Model   exposing (Model)
import Home.Action  exposing (Action(..))


-- Update

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    OnFetched str ->
      case str of
        Just mod ->
          (mod, Effects.none)
        Nothing ->
          (model, Effects.none)
    NoOp ->
      (model, Effects.none)
