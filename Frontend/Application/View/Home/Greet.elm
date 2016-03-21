module Application.View.Home.Greet (greetView) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Color exposing (grey3)

greetView : Html
greetView =
  section [ greetStyle ] [ text "Welcome" ]

greetStyle : Attribute
greetStyle =
  style [ ("font-size", "1.2rem")
        , ("color", grey3)
        , ("margin", "0 0 0.5rem 0")
        ]
