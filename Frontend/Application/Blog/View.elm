module Blog.View where

import Html        exposing (..)
import Blog.Action exposing (Action(..))
import Blog.Model  exposing (Model, PostID)

import Debug exposing (log)

view : Signal.Address Action -> Model -> Html
view address model =
  let
    _ =
      (log "1" "1")
  in
    div
      []
      [ span [] [ text model.id ]
      ]
