module Application.View.Header.Greet (view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Color exposing (grey3)

view : String -> Html
view str =
  section [ greetStyle ] [ text str ]

greetStyle : Attribute
greetStyle =
  style [ ("font-size", "1.2rem")
        , ("color", grey3)
        , ("margin", "0 0 0.5rem 0")
        ]
