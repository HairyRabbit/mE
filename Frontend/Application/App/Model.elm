module App.Model where

import Routing.Model as Routing
import Blog.Model as Blog


type alias Model =
  { routing : Routing.Model
  , blog    : Blog.Model
  }


initModel : Model
initModel =
  { routing = Routing.initModel
  , blog    = Blog.initModel
  }
