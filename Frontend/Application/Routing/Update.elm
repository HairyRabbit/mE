module Routing.Update where

import Effects exposing (Effects)
import Hop
import Hop.Navigate exposing (navigateTo)
import Routing.Action exposing (Action(..))
import Routing.Model exposing (Model)
import Routing.Routes exposing (Route(..))

import Blog.Action as Blog
import Blog.Effects exposing (fetchPost)

import Debug


update : Action -> Model -> (Model, Effects Action, Effects Blog.Action)
update action model =
  case action of
    NavigateTo path ->
      let
        _ =
          Debug.log "path" path
        effects =
          Effects.map HopAction <| navigateTo path
      in
        (model, effects, Effects.none)

    ApplyRoute (route, location) ->
      let
        effects =
          case route of
            BlogRoute id ->
                fetchPost id
            _ ->
              Effects.none

        m = { model |
                route    = route
            ,   location = location
            }
      in
        ( m
        , Effects.none
        , effects
        )

    HopAction () ->
      (model, Effects.none, Effects.none)
