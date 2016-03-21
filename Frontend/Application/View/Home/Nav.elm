module Application.View.Home.Nav (navView) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Color exposing (fcPc, fcG3)


navView : Html
navView =
  nav [navigateStyle]
        [ ul [ menuStyle ]
            [ li [ menuItemStyle ]
                [ a []
                    [ text "Not"
                    , span [ jColor ] [ text "E" ]
                    , text " on"
                    ]
                ]
            , li [ menuItemStyle ]
                [ a []
                    [ text "Fin"
                    , span [ jColor ] [ text "D" ]
                    , text " me"
                    ]
                ]
            ]
        ]

navigateStyle : Attribute
navigateStyle =
  style [ ("position", "absolute")
        , ("bottom", "20%")
        , ("right", "50%")
        ]

menuStyle : Attribute
menuStyle =
  style [ ("list-style-type", "none")
        , ("padding", "0")
        , ("margin", "0")
        ]

menuItemStyle : Attribute
menuItemStyle =
  style [ ("font-size", "1.4rem")
        , fcG3
        , ("font-weight", "100")
        , ("margin", "0.5rem 0")
        ]

jColor : Attribute
jColor =
  style [ fcPc ]
