module Blog.Action where

{-| Blog Action

1. NoOp      什么都不做
2. FetchPost 请求数据
3. OnFetched 请求完成

-}

type Action
  = NoOp
  = OnFetched (Maybe String)
