module Routing.Update where

import Effects exposing (Effects)
import Hop
import Hop.Navigate exposing (navigateTo)
import Routing.Action exposing (Action(..))
import Routing.Model exposing (Model)
import Routing.Routes exposing (Route(..))

import Blog.Action as Blog
import Blog.Update
import Blog.Effects exposing (fetchPost)
import App.Model as App

import Debug


update : Action -> App.Model -> (Model, Effects Action, Effects Blog.Action)
update action model =
  case action of
    NavigateTo path ->
      let
        _ =
          Debug.log "path" path
        effects =
          Effects.map HopAction <| navigateTo path
      in
        (model.routing, effects, Effects.none)

    ApplyRoute (route, location) ->
      let
        _ =
          Debug.log "modelss" model
        m = model.routing
          
        effects =
          case route of
            BlogRoute id ->

              let
                (_, fx) = Blog.Update.update (Blog.FetchPost id) model.blog
              in
                fx
            _ ->
              Effects.none

        m' = { m |
               route = route
             , location = location
             }
      in
        ( m'
        , Effects.none
        , effects
        )

    HopAction () ->
      (model.routing, Effects.none, Effects.none)

