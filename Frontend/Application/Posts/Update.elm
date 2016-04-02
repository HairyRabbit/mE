module Posts.Update where

import Effects exposing (Effects)

import Posts.Action exposing (Action(..))
import Posts.Model exposing (Model)


update : Action -> Model -> (Model, Effecs Action)
update action model =
  case action of
    NewPosts act ->

    NoOp->
      (model, Effects.none)
    
