{- mode: Elm -}
{- coding: utf-8 -}
module About.Model where

import Profile.Model exposing (Contact, Prop)

type alias Model =
  { contacts : List Contact
  , props : List Prop
  }


initModel : Model
initModel =
  { contacts = []
  , props = []
  }
