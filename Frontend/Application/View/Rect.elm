module Application.View.Rect where

import Html exposing (Html, Attribute, section)
import Html.Attributes exposing (style)
import Svg exposing (..)
import Svg.Attributes exposing (..)

rectView : Html
rectView =
  svg [ width "30"
      , height "40"
      , viewBox "0 0 30 40"
      ]
    [ rect [ x "0"
           , y "0"
           , width "30"
           , height "40"
           , opacity "0.16"
           ] []
    ]

rectGroupView1 : String -> String -> Int -> Html
rectGroupView1 x y deg =
  section [ rectStyle x y 0 ]
            [ section [ rectLeftTopStyle ] [ rectView ]
            , section [ rectStyle "26" "20" deg] [ rectView ]
            ]

rectStyle : String -> String -> Int -> Html.Attribute
rectStyle x y deg =
  Html.Attributes.style [ ("position","absolute")
                        , ("top", x)
                        , ("left", y)
                        , ("transform", "rotate(" ++ toString deg ++ "deg)")
                        ]

rectLeftTopStyle : Html.Attribute
rectLeftTopStyle =
  rectStyle "0" "0" 0
