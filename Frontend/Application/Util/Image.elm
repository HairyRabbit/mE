module Util.Image where

{-| -}

import Html            exposing (..)
import Html.Attributes exposing (..)


type alias Path = String

image : Path -> Html
image path = img [ src path ] []
