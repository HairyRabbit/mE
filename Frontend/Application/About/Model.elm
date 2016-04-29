{- mode: Elm -}
{- coding: utf-8 -}
module About.Model where

import Profile.Model exposing (Contact, Prop, Me, initMe)
import Icon.Model    exposing (Lang)

type alias Model =
  { contacts : List Contact
  , props    : List Prop
  , langs    : List Lang
  , me       : Me
  }


initModel : Model
initModel =
  { contacts = []
  , props    = []
  , langs    = []
  , me       = initMe
  }
