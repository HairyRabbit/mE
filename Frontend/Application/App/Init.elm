module App.Init (init) where

{-| Init

初始化请求博客文章列表

-}

import Effects
import App.Action exposing (Action(..))
import App.Model  exposing (initModel)



init =
  (initModel, Effects.none)
