module Home.Update where

import Effects exposing (Effects)
import Home.Action exposing (Action(..))
import Home.Model exposing (Model)
--import Hotspot.Update as Hotspot
import Post


{-
update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    ActionHotspot act ->
      let
        (m, fx) = Hotspot.update act model.hotspot
      in
      ( Model m
      , Effects.map ActionHotspot fx
      )

    NoOp ->
      ( model
      , Effects.none
      )
-}

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    ActionPost act ->
      let
        (m, fx) = Post.update act model.posts
      in
        ( Model m
        , Effects.map ActionPost fx
        )

    NoOp ->
      ( model
      , Effects.none
      )
