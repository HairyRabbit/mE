module Model where

import Router.Model as Router
import Home.Model   as Home
import Posts.Model  as Posts


type alias Model =
  { router : Router.Model
  , home   : Home.Model
  , posts  : Posts.Model
  }
