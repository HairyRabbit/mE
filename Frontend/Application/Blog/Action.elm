module Blog.Action where

{-| Blog Action

1. NoOp      什么都不做
3. OnFetched 请求完成

-}

import Blog.Model exposing (Model)

type Action
  = NoOp
  | OnFetched (Maybe Model)
