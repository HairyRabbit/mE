module Blog.Action (Action(..)) where

{-| Action

文章详情

* OnFetched 请求完成

-}

import Blog.Model exposing (Model)



type Action
  = NoOp
  | OnFetched (Maybe Model)
