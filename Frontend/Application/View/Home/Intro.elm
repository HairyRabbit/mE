module Application.View.Home.Intro (introView) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Color exposing (grey3)

introView : Html
introView =
  section [ introStyle ] [ text "Happy Hack with my life" ]

introStyle : Attribute
introStyle =
  style [ ("font-size", "0.85rem")
        , ("color", grey3)
        ]
