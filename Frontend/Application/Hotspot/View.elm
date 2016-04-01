module Hotspot.View where

import Html exposing (..)
import Html.Attributes exposing (..)
import Hotspot.Action exposing (Action(..))
import Hotspot.Model exposing (Model)


view : Signal.Address Action -> Model -> Html
view address model =
  section
    [ class "md"
    , conStyle
    ]
    [ h1 [] [ text model.title ]
    , p [ class "date" ] [ text model.date ]
    , p [] [ text model.intro ]
    ]

conStyle : Attribute
conStyle =
  style [ ("width", "80%")
        , ("height", "40%")
        ]
