module Application.View.Home.Nav (view) where

import Html exposing (..)
import Html.Attributes exposing (..)
import String exposing (split, toUpper)
import List exposing (map)
import Application.Style.Color exposing (fcPc, fcG3)
import Application.Sitemap exposing (..)

view : (List Html -> Html) -> (List Html -> Html) -> Html
view link1 link2 =
  nav
    [navigateStyle]
    [ ul
        [ class "listReset" ]
        [ listItemView <| link1 <| linkerView "Note on" "e"
        , listItemView <| link2 <| linkerView "Find me" "d"
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
    map dom <| split "" str

listItemView : Html -> Html
listItemView linker = li [ listItemStyle ] [ linker ]

navigateStyle : Attribute
navigateStyle =
  style [ ("position", "absolute")
        , ("bottom", "20%")
        , ("right", "50%")
        ]

listItemStyle : Attribute
listItemStyle =
  style [ ("margin", "0.5rem 0")
        , ("font-size", "1.4rem")
        , ("font-weight", "100")
        , fcG3
        ]

redColor : Attribute
redColor = style [ fcPc ]
