module Home.View where

import Html exposing (..)
import Html.Attributes exposing (..)
import Home.Action exposing (Action(..))
import Home.Model exposing (Model)
import Header.View

import Hotspot.View as Hotspot

view : Signal.Address Action -> Model -> Html
view address model =
  main'
    [ mainStyle ]
    [ section
        [ leftStyle  ]
        [ Hotspot.view (Signal.forwardTo address ActionHotspot) model.hotspot ]
    , section
        [ rightStyle ]
        [ Header.View.view "Welcome"
        , section
            [ helloStyle
            , class "noSelected"
            ]
            [ img
                [ imageStyle
                , src "./Image/Just-me.jpg"
                ] []
            ]
        ]
    ]

    
mainStyle : Attribute
mainStyle =
  style [ ("width", "64rem")
        , ("height", "50rem")
        , ("position", "relative")
        , ("display", "flex")
        ]
    
leftStyle : Attribute
leftStyle =
  style [ ("position", "relative")
        , ("flex", "1 0 50%")
        , ("display", "flex")
        , ("justifyContent", "center")
        , ("alignItems", "center")
        ]
    
rightStyle : Attribute
rightStyle =
  style [ ("position", "relative")
        , ("flex", "1 0 50%")
        , ("display", "flex")
        , ("justifyContent", "center")
        , ("alignItems", "center")
        ]

helloStyle : Attribute
helloStyle =
  style [ ("display", "flex")
        , ("justifyContent", "center")
        , ("alignItems", "center")
        ]

imageStyle : Attribute
imageStyle =
  style [ ("width", "60%")
        , ("height", "auto")
        ]
