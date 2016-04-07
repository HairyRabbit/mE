module Notfound.View where

import Html            exposing (..)
import Html.Attributes exposing (..)
import Util.Image      exposing (image)
import Util.Classes    exposing (class3)

view : Html
view =
  main'
    [ class3 "con-home" "flex-con" "flex-col" ]
    [ section [ class "mb2 g4" ] [ text "貌似，木有找到..." ]
    , section [ ] [ image imagePath ]
    ]

imagePath : String
imagePath = "./Image/Cat.jpg"
