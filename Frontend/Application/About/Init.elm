{- mode: Elm -}
{- coding: utf-8 -}
module About.Init where

import About.Model exposing (Model)
import Profile.Model exposing (Contact, Prop)

init : List Contact -> List Prop -> Model
init contacts props =
  Model contacts props
