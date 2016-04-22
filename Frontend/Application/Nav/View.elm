module Nav.View (view, bloglinker) where

{-| View

导航

@todo
增加动画效果

-}

import Html            exposing (..)
import Html.Attributes exposing (..)
import String          exposing (split, toUpper)



view : List Html
view =
  [ navView "/#/"      "Home IO"  "e"
  , navView "/#/blog"  "Note On"  "e"
  , navView "/#/about" "About Me" "t"
  ]


navView : String -> String -> String -> Html
navView link str char =
  let
    dom c =
      if c == char
      then span [ class "nav-char" ] [ text <| toUpper c ]
      else span [] [ text c ]

    content =
      str
        |> split ""
        |> List.map dom
        |> section [ class "nav" ]
  in
    section [ class "nav-item" ]
      [ a [ href link] [ content ]
      ]

bloglinker : String -> List Html -> Html
bloglinker id content =
  a [ href <| "/#/blog/" ++ id ] content
