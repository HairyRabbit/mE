module Router.Update where

import Effects exposing (Effects)
import History
import Task
import Router.Action exposing (Action(..))
import Router.Model exposing (Model, pathToPage, Page(..))
import Router.Routes exposing (route)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    PathChange path ->
      ( { page = pathToPage path }
      , Effects.none
      )
    UpdatePath r ->
      let
        effects =
          route r
            |> History.setPath
            |> Task.toMaybe
            |> Task.map (always NoOp)
            |> Effects.task
      in
        ( model
        , effects
        )
    NoOp ->
      ( model
      , Effects.none
      )
