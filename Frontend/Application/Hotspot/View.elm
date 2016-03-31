module Hotspot.View where

import Hotspot.Action exposing (..)
import Hotspot.Model  exposing (..)
import Html           exposing (..)

view : Signal.Address Action -> Model -> Html
view address model =
  section
    []
    [ h1 [] [ text model.title ]
    ]
     
