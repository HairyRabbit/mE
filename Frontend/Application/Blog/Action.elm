module Blog.Action (Action(..)) where

{-| Action

文章详情

* OnFetched 请求完成

-}

import Blog.Model exposing (Model)
import Post.Model exposing (Post)



type Action
  = NoOp
  | OnFetched (Maybe Post)
  | OnContentFetched (Maybe String)
