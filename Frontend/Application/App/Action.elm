module App.Action (Action(..)) where

{-| Action

组合所有 Action

-}

import Routing.Action as Routing
import Blog.Action    as Blog
import Blogs.Action   as Blogs
import Home.Action    as Home
import About.Action    as About



type Action
  = NoOp
  | RoutingAction Routing.Action
  | BlogAction    Blog.Action
  | BlogsAction   Blogs.Action
  | HomeAction    Home.Action
  | AboutAction   About.Action
