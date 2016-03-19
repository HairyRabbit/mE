module Application.View.Home.Greet (greetView) where

import Html exposing (..)
import Html.Attributes exposing (..)

greetView : Html
greetView =
  section [ greetStyle ] [ text "Welcome" ]

greetStyle : Attribute
greetStyle =
  style [ ("font-size", "1.25rem")
        , ("color", "rgba(0, 0, 0, 0.72)")
        , ("margin", "0 0 0.5rem 0")
        ]
