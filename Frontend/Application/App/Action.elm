module App.Action where

import Routing.Action as Routing
import Blog.Action    as Blog
import Home.Action    as Home

type Action
  = NoOp
  | RoutingAction Routing.Action
  | BlogAction    Blog.Action
  | HomeAction    Home.Action
