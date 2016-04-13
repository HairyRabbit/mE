module App.Action where

import Routing.Action as Routing
import Blog.Action as Blog

type Action
  = NoOp
  | RoutingAction Routing.Action
  | BlogAction Blog.Action
