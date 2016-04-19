module App.Model (Model, initModel) where

{-| Model

组合所有 Model

-}

import Routing.Model as Routing
import Blog.Model    as Blog
import Blogs.Model   as Blogs
import Home.Model    as Home



type alias Model =
  { routing : Routing.Model
  , blog    : Blog.Model
  , blogs   : Blogs.Model
  , home    : Home.Model
  }


initModel : Model
initModel =
  { routing = Routing.initModel
  , blog    = Blog.initModel
  , blogs   = Blogs.initModel
  , home    = Home.initModel
  }
