module Router.Input where

import History
import Router.Action exposing (Action(..))
import Action as RootAction exposing (Action(..))

input : Signal RootAction.Action
input =
  Signal.map (ActionRouter << PathChange) History.hash
