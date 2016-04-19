module Home.Update (update) where

{-| Update

首页

* OnFetched 向服务器请求数据

-}

import Effects      exposing (Effects)
import Home.Model   exposing (Model)
import Home.Action  exposing (Action(..))



update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    OnFetched str ->
      case str of
        Just mod ->
          (mod, Effects.none)
        Nothing ->
          (model, Effects.none)
    NoOp ->
      (model, Effects.none)
