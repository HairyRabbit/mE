module Logo.View (view, logo, Direction(..)) where

{-| 这里是LOGO -}

import Html            exposing (..)
import Html.Attributes exposing (..)
import Util.Class      exposing (class2)


type alias Greet = String


type Direction
  = Left
  | Right


-- View

(=>) = (,)

view : Direction -> Greet -> Html
view dir str =
  let

    needReverse =
      case dir of
        Left ->
          [ "flex-flow" => "row nowrap" ]
        Right ->
          [ "flex-flow" => "row-reverse nowrap" ]

    logo' =
      section
        [ class "flex-con" ]
        [ logoView ]


    intro' =
      section
        [ class2 "flex-col" "flex-justify-cen" ]
        [ labelView dir str
        , introView
        ]

  in
    
    header
      [ class2 "none-select" "flex"
      , style needReverse
      ]
      [ logo'
      , intro'
      ]
      

logoView : Html
logoView =
  section [ class "logo" ]
          [ span [] [ text "H" ]
          , span [ class "red" ] [ text "J" ]
          ]


labelView : Direction -> Greet -> Html
labelView dir str =
  let
    
    needRightAlign =
      case dir of
        Left ->
          [ "text-align" => "left" ]
        Right ->
          [ "text-align" => "right" ]

  in

    section
      [ class "logo-label"
      , style needRightAlign
      ]
      [ text str ]


introView : Html
introView =
  section
    [ class "logo-intro" ]
    [ text "Happy Hack With My Life" ]


logo : Html
logo =
  section
    [ class "logo-pic" ]
    [ img [ src "Image/logo.svg" ] []
    ]
