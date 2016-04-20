module Home.Action (Action(..)) where

{-| Action

首页

* OnFetched 请求数据

-}

import Home.Model exposing (Model)



type Action
  = NoOp
  | OnFetched (Maybe (List Model))
