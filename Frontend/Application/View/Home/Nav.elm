module Application.View.Home.Nav (navView) where

import Html exposing (..)
import Html.Attributes exposing (..)

navView : Html
navView =
  nav [navigateStyle]
        [ ul [ menuStyle ]
            [ li [ menuItemStyle ]
                [ a []
                    [ text "BloG" ]
                ]
            , li [ menuItemStyle ]
                [ a []
                    [ text "aBouT" ]
                ]
            ]
        ]

navigateStyle : Attribute
navigateStyle =
  style [ ("position", "absolute")
        , ("top", "0")
        , ("left", "0")
        ]

menuStyle : Attribute
menuStyle =
  style [ ("list-style-type", "none")
        , ("padding", "0")
        , ("margin", "0")
        ]

menuItemStyle : Attribute
menuItemStyle =
  style [ ("font-size", "1.5rem")
        , ("font-family", "Ubuntu")
        , ("font-weight", "100")
        , ("line-height", "1")
        , ("color", "rgba(0, 0, 0, 0.56)")
        , ("margin", "0.5rem 0")
        ]


resetFont : String
resetFont =
  "Robot" ++ "Ubuntu,\"微软雅黑\", \"华文黑体\""
