module Blog.View where

import Html        exposing (..)
import Blog.Action exposing (Action(..))
import Blog.Model  exposing (Model, PostID)

view : Signal.Address Action -> Model -> Html
view address model =
  div
    []
    [ span [] [ text id ]
    ]
