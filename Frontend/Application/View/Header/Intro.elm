module Application.View.Header.Intro (view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Color exposing (grey2)

view : Html
view =
  section [ introStyle ] [ text "Happy Hack With My Life" ]

introStyle : Attribute
introStyle =
  style [ ("font-size", "0.8rem")
        , ("color", grey2)
        ]
