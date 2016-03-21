module Application.View.Home.Intro (introView) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Color exposing (grey2)

introView : Html
introView =
  section [ introStyle ] [ text "Happy Hack with my life" ]

introStyle : Attribute
introStyle =
  style [ ("font-size", "0.8rem")
        , ("color", grey2)
        ]
