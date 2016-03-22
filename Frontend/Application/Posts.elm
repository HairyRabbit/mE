module Application.Posts (view) where

import Html exposing (..)
import Html.Attributes exposing (..)

view : Html
view =
  main'
    [ mainStyle ]
    []


mainStyle: Attribute
mainStyle =
  style <| [ ("width", "64rem")
           , ("height", "100%")
           ]
