{- mode: Elm -}
{- coding: utf-8 -}
module About.Init where

import About.Model   exposing (Model)
import Profile.Model exposing (Contact, Prop, Me)
import Icon.Model    exposing (Lang)

init : List Contact -> List Prop -> List Lang -> Me -> Model
init contacts props langs me =
  Model contacts props langs me
