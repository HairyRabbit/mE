module App.Update where

import Effects exposing (Effects)
import App.Action exposing (Action(..))
import App.Model exposing (Model)
import Routing.Update as Routing
import Blog.Update as Blog

import Debug

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RoutingAction act ->
      let
        (m, fx, fx2) = Routing.update act model.routing
        
        effects =
          Effects.batch
            [ Effects.map RoutingAction fx
            , Effects.map BlogAction fx2
            ]
      in
        ( { model | routing = m }
        , effects
        )
        
    BlogAction act ->
      let
        (m, fx) = Blog.update act model.blog
      in
        ( { model | blog = (Debug.log "mm" m) }
        , Effects.map BlogAction fx
        )
        
    _ ->
      (model, Effects.none)
