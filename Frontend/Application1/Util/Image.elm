module Util.Image where

{-| 优雅地创建一张图片（笑） -}

import Html exposing (..)
import Html.Attributes exposing (..)


type alias Path = String

image : Path -> Html
image path = img [ src path ] []
