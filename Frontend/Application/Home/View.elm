module Home.View where

{-| Home 主页视图 -}

import Html            exposing (..)
import Html.Attributes exposing (..)
import Html.Events     exposing (onClick)
import Util.Image      exposing (image)
import Util.Classes    exposing (class2)

import Home.Action     exposing (Action(..))
import Home.Model      exposing (Model)

import Header.View     as Header
import Hotspot.View    as Hotspot


view : Signal.Address Action -> Model -> Html -> Html
view address model nav =
  let
    hotspotView =
      Hotspot.view (Signal.forwardTo address ActionHotspot) model.hotspot

    navView =
      section [ class "nav-home" ] [ nav ]

    headerView =
      section [ class "logo-home" ] [ Header.view "Welcome" ]

    imageView =
      section
        [ class2 "none-select" "flex-con" ]
        [ section [ class "img-home" ] [ image imagePath ]
        ]

    leftView =
      [ hotspotView ]

    rightView =
      [ headerView
      , imageView
      , navView
      ]

  in
    main'
      [ class "con-home" ]
      [ section [ class "con-home-item" ] leftView
      , section [ class "con-home-item" ] rightView
      ]


imagePath : String
imagePath = "./Image/Just-me.jpg"
