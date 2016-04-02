module Home.View where

{-| Home 主页视图 -}

import Html            exposing (..)
import Html.Attributes exposing (..)
import Html.Events     exposing (onClick)
import Util.Image      exposing (image)

import Home.Action exposing (Action(..))
import Home.Model  exposing (Model)

import Header.View  as Header
import Hotspot.View as Hotspot


view : Signal.Address Action -> Model -> Html -> Html
view address model nav =
  let
    hotspotView =
      Hotspot.view (Signal.forwardTo address ActionHotspot) model.hotspot

    navView =
      section [ navStyle ] [ nav ]

    headerView =
      section [ headerStyle ] [ Header.view "Welcome" ]

    imageView =
      section
        [ helloStyle, class "noSelected" ]
        [ section [ imgStyle ] [ image imagePath ]]

    leftView =
      [ hotspotView ]

    rightView =
      [ headerView
      , imageView
      , navView
      ]
      
  in
    main'
      [ mainStyle ]
      [ section [ leftStyle  ] leftView
      , section [ rightStyle ] rightView
      ]


imagePath : String
imagePath = "./Image/Just-me.jpg"

    
mainStyle : Attribute
mainStyle =
  style [ ("width", "64rem")
        , ("height", "40rem")
        , ("position", "relative")
        , ("display", "flex")
        ]
  {-
  style [ ("width", "100%")
        , ("height", "100%")
        , ("position", "relative")
        , ("display", "flex")
        , ("padding", "1rem")
        , ("box-sizing", "border-box")
        ]
   -}

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

imgStyle : Attribute
imgStyle =
  style [ ("width", "60%")
        , ("height", "auto")
        ]
  {- 
  style [ ("width", "auto")
        , ("height", "100%")
        ]
   -}

navStyle : Attribute
navStyle =
  style [ ("position", "absolute")
        , ("bottom", "30%")
        , ("right", "50%")
        ]

headerStyle : Attribute
headerStyle =
  style [ ("padding","0 0 20rem 0") ]    
