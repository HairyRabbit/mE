module Nav.View where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (split, toUpper)
import Router.Routes exposing (Sitemap(..))
import Router.Action as Router exposing (Action(..))
import Debug exposing (log)

view : Signal.Address Router.Action -> Html
view address =
  let
    link route =
      a [ onClick address <| UpdatePath route ]
  in
    nav
      [ navigateStyle ]
      [ ul
          [ class "listReset" ]
          [ listItemView <| link (HomeRoute ()) <| linkerView "Note on" "e"
          -- , listItemView <| link <| linkerView "Find me" "d"
          ]
      ]


linkerView : String -> String -> List Html
linkerView str char =
  let
    dom c =
      if c == char
      then span [ redColor ] [ text <| toUpper c ]
      else span [] [ text c ]
  in
    List.map dom <| split "" str

listItemView : Html -> Html
listItemView linker =
  li [ listItemStyle ] [ linker ]

navigateStyle : Attribute
navigateStyle =
  style [ ("position", "absolute")
        , ("bottom", "30%")
        , ("right", "33%")
        ]

listItemStyle : Attribute
listItemStyle =
  style [ ("margin", "0.5rem 0")
        , ("font-size", "1.4rem")
        , ("font-weight", "100")
        , ("color", "rgba(0, 0, 0, 0.56)")
        ]

redColor : Attribute
redColor =
  style [ ("color", "red") ]
