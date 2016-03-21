module Application.View.Home.Logo (logoView) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Color exposing (fcPc)

logoView : Html
logoView =
  section [ logoStyle ]
            [ span [] [ text "H" ]
            , span [ jColor ] [ text "J" ]
            ]

logoStyle : Attribute
logoStyle =
  style [ ("font-size", "4rem")
        , ("font-weight", "100")
        , ("margin", "0 1rem 0 0")
        ]

jColor : Attribute
jColor =
  style [ fcPc ]
