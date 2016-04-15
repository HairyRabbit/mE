module Main (..) where

import Html    exposing (..)
import Effects exposing (Effects, Never)
import Task
import StartApp

--
import App.Init     exposing (init)
import App.Input    exposing (inputs)
import App.Update   exposing (update)
import App.View     exposing (view)
import App.Model    exposing (Model)
import Routing.Port as Routing

app : StartApp.App Model
app =
  StartApp.start
    { init   = init
    , inputs = inputs
    , update = update
    , view   = view
    }

main : Signal.Signal Html
main =
  app.html

port runner : Signal (Task.Task Never ())
port runner =
  app.tasks


port routeRunTask : Task.Task () ()
port routeRunTask =
  Routing.run

