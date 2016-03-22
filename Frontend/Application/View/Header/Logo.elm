module Application.View.Header.Logo (view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Color exposing (fcPc)

view : Html
view =
  section [ logoStyle ]
            [ span [] [ text "H" ]
            , span [ redColor ] [ text "J" ]
            ]

logoStyle : Attribute
logoStyle =
  style [ ("font-size", "4rem")
        , ("font-weight", "100")
        , ("margin", "0 1rem")
        ]

redColor : Attribute
redColor =
  style [ fcPc ]
