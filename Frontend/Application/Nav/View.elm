module Nav.View where

{-| 导航 -}

import Html            exposing (..)
import Html.Attributes exposing (..)
import String          exposing (split, toUpper)



view : String -> String -> String -> Html
view link str char =
  let
    dom c =
      if c == char
      then span [ class "red" ] [ text <| toUpper c ]
      else span [] [ text c ]

    ctx =
      List.map dom <| split "" str

    view' =
      section [ class "nav" ] <| ctx

    aview =
      a
        [ href link ]
        [ view' ]

  in
    section [] [ aview ]

