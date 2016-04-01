module Router.Update where

import Effects exposing (Effects)
import History
import Task
import Router.Action as Router exposing (Action(..))
import Router.Model exposing (Model, pathToPage, Page(..))
import Router.Routes exposing (route)
import Action as RootAction exposing (Action(..))


update : Router.Action -> Model -> (Model, Effects Router.Action)
update action model =
  case action of
    PathChange path ->
      ( { page = pathToPage path }
      , Effects.none
      )
    UpdatePath r ->
      let
        act =
          route r
            |> History.setPath
            |> Task.toMaybe
            |> Task.map (always Router.NoOp)
            |> Effects.task
      in
        ( model
        , act
        )
    Router.NoOp ->
      ( model
      , Effects.none
      )

routeInput : Signal RootAction.Action
routeInput =
  Signal.map (ActionRouter << PathChange) History.hash

