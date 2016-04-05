module Action where

import Router.Action as Router
import Home.Action   as Home
import Posts.Action  as Posts

type Action
  = NoOp
  | ActionRouter Router.Action
  | ActionHome   Home.Action
  | ActionPosts  Posts.Action
