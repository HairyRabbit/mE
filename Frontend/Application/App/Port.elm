module App.Port where

import Profile.Model exposing (Contact, Prop, Me)
import Icon.Model    exposing (Lang)

type alias Ports =
  { contacts : List Contact
  , props    : List Prop
  , langs    : List Lang
  , me       : Me
  }
