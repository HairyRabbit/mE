module Home.Init where

import Effects      exposing (Effects)
import Home.Action  exposing (Action(..))
import Home.Model   exposing (Model, initModel)
import Home.Effects exposing (fetchPost)

init : (Model, Effects Action)
init =
  (initModel, fetchPost)
