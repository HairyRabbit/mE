module Home.View where

import Html            exposing (..)
import Html.Attributes exposing (..)
import Home.Action
import Home.Model
import Hotspot.Model   exposing (..)
import Header.View
import Hotspot.View

view : Signal.Address Home.Action.Action -> Home.Model.Model -> Html
view address model =
  --Hotspot.View.view address model
  main' [ mainStyle ]
        [ section [ leftStyle  ]
                  [ Hotspot.View.view (Signal.forwardTo address Home.Action.ActionHotspot) model.hotspot ]
            --[]
        , section [ rightStyle ]
                  [ Header.View.view "Welcome"
                  , section [ helloStyle ]
                            [ img [ imageStyle
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
        , ("user-select", "none")
        , ("-moz-user-select", "none")
        , ("pointer-events", "none")
        ]
