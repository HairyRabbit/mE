module Main where

import Graphics.Element exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

main : Html
main =
  main' [ mainStyle ]
          [ section [ mainLeftStyle ]
              [ header [ noticeStyle ]
                  [ text "Comming Soon ... " ]
              ]
          , section [ mainRightStyle ]
              [ header [ headerStyle ]
                  [ section [ headerLeftStyle ]
                      [ div [ logoStyle ] [ text "HJ" ] ]
                  , section [ headerRightStyle ]
                      [ div [ welcomeStyle ] [ text "Welcome" ]
                      , div [ introStyle ] [ text "Happy Hack with my life" ]
                      ]
                  ]
              , nav [ navigateStyle ]
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
              ]
          ]

mainStyle : Attribute
mainStyle =
  style [ ("max-width", "1000px")
        , ("margin", "0 auto")
        , ("position", "fixed")
        , ("top", "0")
        , ("right", "0")
        , ("bottom", "0")
        , ("left", "0")
        , ("display", "flex")
        , ("padding", "5% 0")
        ]

mainLeftStyle : Attribute
mainLeftStyle =
  style [ ("position", "relative")
        , ("display", "flex")
        , ("justify-content", "center")
        , ("flex", "1 1 auto")
        , ("align-items", "center")
        ]

mainRightStyle : Attribute
mainRightStyle =
  style [ ("position", "relative")
        , ("display", "flex")
        , ("justify-content", "center")
        , ("flex", "1 1 auto")
        , ("align-items", "center")
        ]


logoStyle : Attribute
logoStyle =
  style [ ("font-size", "4rem")
        , ("font-family", "Ubuntu")
        , ("font-weight", "100")
        , ("line-height", "1")
        , ("margin", "0 1rem 0 0")
        ]

welcomeStyle : Attribute
welcomeStyle =
  style [ ("font-size", "1.25rem")
        , ("font-family", "Ubuntu")
        , ("font-weight", "100")
        , ("line-height", "1")
        , ("color", "rgba(0, 0, 0, 0.72)")
        , ("margin", "0 0 0.5rem 0")
        ]

introStyle : Attribute
introStyle =
  style [ ("font-size", "0.85rem")
        , ("font-family", "Ubuntu")
        , ("font-weight", "100")
        , ("line-height", "1")
        , ("color", "rgba(0, 0, 0, 0.56)")
        ]

headerStyle : Attribute
headerStyle =
  style [ ("display", "flex") ]

headerLeftStyle : Attribute
headerLeftStyle =
  style [ ("display", "flex")
        , ("justify-content", "center")
        , ("align-items", "center")
        ]

headerRightStyle : Attribute
headerRightStyle =
  style [ ("display", "flex")
        , ("justify-content", "center")
        , ("align-items", "flex-start")
        , ("flex-flow", "column nowrap")
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

noticeStyle : Attribute
noticeStyle =
  style [ ("font-size", "1.5rem")
        , ("font-family", "Ubuntu")
        , ("font-weight", "100")
        , ("line-height", "1")
        , ("color", "rgba(0, 0, 0, 0.80)")
        ]
