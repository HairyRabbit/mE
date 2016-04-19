module Routing.Input (input) where

{-| Input

路由信号，通知 history 跳转

-}

import Routing.Action exposing (Action(..))
import Routing.Routes exposing (router)



input : Signal Action
input =
  Signal.map ApplyRoute router.signal
