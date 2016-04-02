module Nav.View where

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String exposing (split, toUpper)
import Router.Routes exposing (Sitemap(..))
import Router.Action as Router exposing (Action(..))


view : Signal.Address Router.Action -> String -> Html
view address label =
  let
    link route =
      a [ onClick address <| UpdatePath route ]

    homeLinker =
      listItemView <| link (HomeRoute ()) <| linkerView "Home io" "e"

    postsLinker =
      listItemView <| link (PostsRoute ()) <| linkerView "Note on" "e"
                 
    linkers =
      case label of
        "home" ->
          [ postsLinker ]
        "posts" ->
          [ homeLinker ]
        _ ->
          []
  in
    nav [ ] [ ul [ class "listReset" ] linkers ]

  {-
  [ listItemView <| link (HomeRoute ()) <| linkerView "Home io" "e"
  , listItemView <| link (PostsRoute ()) <| linkerView "Note on" "e"
  , listItemView <| link (HomeRoute ()) <| linkerView "Find me" "d"
  ]
   -}      
      
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
