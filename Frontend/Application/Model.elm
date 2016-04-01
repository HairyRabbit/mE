module Model where

import Router.Model as Router
import Home.Model   as Home


type alias Model =
  { router : Router.Model
  , home   : Home.Model
  }
