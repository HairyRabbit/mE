module Blog.Update where

import Effects      exposing (Effects)
import Blog.Model   exposing (Model)
import Blog.Action  exposing (Action(..))


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
