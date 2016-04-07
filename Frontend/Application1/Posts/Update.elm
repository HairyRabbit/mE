module Posts.Update where

import Effects exposing (Effects)

import Posts.Action exposing (Action(..))
import Posts.Model exposing (Model)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NewPosts act ->
      case act of
        Just d ->
          (d, Effects.none)
        Nothing ->
          (model, Effects.none)
    NoOp->
      (model, Effects.none)

