module App.Model where

import Routing.Model as Routing
import Blog.Model    as Blog
import Home.Model    as Home


type alias Model =
  { routing : Routing.Model
  , blog    : Blog.Model
  , home    : Home.Model
  }


initModel : Model
initModel =
  { routing = Routing.initModel
  , blog    = Blog.initModel
  , home    = Home.initModel
  }
