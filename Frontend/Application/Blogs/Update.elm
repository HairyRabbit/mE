module Blogs.Update where

import Effects       exposing (Effects)
import Blogs.Model   exposing (Model)
import Blogs.Action  exposing (Action(..))
import Blogs.Effects exposing (nextPosts, prevPosts)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    OnFetched str ->
      case str of
        Just mod ->
          ( { model | posts = mod }
          , Effects.none
          )
        Nothing ->
          (model, Effects.none)
    OnNextFetched str ->
      case str of
        Just mod ->
          ( { model | posts = mod, current = model.current + 5 }
          , Effects.none
          )
        Nothing ->
          (model, Effects.none)
    NextPosts ->
      (model, nextPosts model.current)
    PrevPosts ->
      (model, prevPosts)
    NoOp ->
      (model, Effects.none)
