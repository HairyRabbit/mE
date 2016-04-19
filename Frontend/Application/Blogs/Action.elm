module Blogs.Action (Action(..)) where

{-| Action

文章博客列表

* OnFetched 请求数据
* NextPosts 下一页
* PrevPosts 上一页

-}

import Blogs.Model exposing (Model)
import Post.Model  exposing (Post)



type Action
  = NoOp
  | OnFetched (Maybe (List Post))
  | NextPosts
  | PrevPosts
