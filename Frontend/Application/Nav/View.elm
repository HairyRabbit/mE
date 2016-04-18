module Nav.View where

{-| 导航 

@todo
增加动画效果

-}

import Html            exposing (..)
import Html.Attributes exposing (..)
import String          exposing (split, toUpper)



-- View

view : List Html
view =
  [ navView "/"      "Home IO"  "e"
  , navView "/blog"  "Note On"  "e"
  , navView "/about" "About Me" "t"
  ]


navView : String -> String -> String -> Html
navView link str char =
  let
    dom c =
      if c == char
      then span [ class "nav-char" ] [ text <| toUpper c ]
      else span [] [ text c ]

    view' =
      str
        |> split ""
        |> List.map dom
        |> section [ class "nav" ]

  in
    section []
      [ a [ href link] [ view' ]
      ]
