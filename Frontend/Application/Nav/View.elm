module Nav.View where

{-| 导航 -}

import Html            exposing (..)
import Html.Attributes exposing (..)
import String          exposing (split, toUpper)

{-
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
    nav [ ] [ ul [ class "list-rs" ] linkers ]

  {-
  [ listItemView <| link (HomeRoute ()) <| linkerView "Home io" "e"
  , listItemView <| link (PostsRoute ()) <| linkerView "Note on" "e"
  , listItemView <| link (HomeRoute ()) <| linkerView "Find me" "d"
  ]
   -}

-}

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

