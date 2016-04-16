module Routing.Update where

import Effects exposing (Effects)
import Hop
import Hop.Navigate exposing (navigateTo)
import Routing.Action exposing (Action(..))
import Routing.Model exposing (Model)
import Routing.Routes exposing (Route(..), routerConfig)

import Blog.Action as Blog
import Blog.Effects exposing (fetchPost)

import Home.Action as Home
import Home.Effects exposing (fetchTop)

import Debug


update : Action -> Model -> (Model, Effects Action, Effects Blog.Action, Effects Home.Action)
update action model =
  case action of
    NavigateTo path ->
      let

        fx =
          Effects.map HopAction <| navigateTo routerConfig path

      in

        (model, fx, Effects.none, Effects.none)

    ApplyRoute (route, location) ->
      let
        
        out =
          case route of
            BlogRoute id ->
              (m, Effects.none, fetchPost id, Effects.none)
            HomeRoute ->
              (m, Effects.none, Effects.none, fetchTop)
            _ ->
              (m, Effects.none, Effects.none, Effects.none)

        m = { model |
                route    = route
            ,   location = location
            }

      in
        out

    HopAction () ->
      (model, Effects.none, Effects.none, Effects.none)
