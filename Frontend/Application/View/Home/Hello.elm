module Application.View.Home.Hello (helloView) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Flex exposing (..)

helloView : Html
helloView =
  section [ helloStyle ]
            [ img [ imageStyle
                  , src imagePath ] []
            ]

helloStyle : Attribute
helloStyle =
  style <| flexStyle flexCenter

imagePath : String
imagePath =
  "./Image/Just-me.jpg"

imageStyle : Attribute
imageStyle =
  style [ ("width", "60%")
        , ("height", "auto")
        ]
