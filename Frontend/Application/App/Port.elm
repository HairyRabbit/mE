module App.Port where

import Profile.Model exposing (Contact, Prop)

type alias Ports =
  { contacts : List Contact
  , props    : List Prop
  }
