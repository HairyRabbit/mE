module Blogs.Action where

import Blogs.Model exposing (Model)
import Post.Model exposing (Post)



type Action
  = NoOp
  | OnFetched (Maybe (List Post))
  | OnNextFetched (Maybe (List Post))
  | NextPosts
  | PrevPosts
