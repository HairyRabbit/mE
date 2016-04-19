module Routing.Port (run) where

{-| Port

接口，用于副作用

-}

import Task exposing (Task)
import Routing.Routes exposing (router)



run : Task () ()
run =
  router.run
