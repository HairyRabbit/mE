module Routing.Port where

import Task exposing (Task)
import Routing.Routes exposing (router)

run : Task () ()
run =
  router.run
