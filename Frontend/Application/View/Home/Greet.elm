module Application.View.Home.Greet (greetView) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Color exposing (grey4)

greetView : Html
greetView =
  section [ greetStyle ] [ text "Welcome" ]

greetStyle : Attribute
greetStyle =
  style [ ("font-size", "1.25rem")
        , ("color", grey4)
        , ("margin", "0 0 0.5rem 0")
        ]
