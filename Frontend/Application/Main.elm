module Main (..) where

{-| Bootstrap



-}

import Html    exposing (..)
import Effects exposing (Effects, Never)
import Task
import StartApp


import App.Init     exposing (init)
import App.Input    exposing (inputs)
import App.Update   exposing (update)
import App.View     exposing (view)
import App.Model    exposing (Model)
import App.Port     exposing (Ports)
import Routing.Port as Routing
import Routing.Model
import Profile.Model exposing (Contact, Prop)

ports : Ports
ports =
  Ports contacts props

app : StartApp.App Model
app =
  StartApp.start
    { init   = init ports
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


port routing : Signal String
port routing =
  Signal.map (.routing >> toString) app.model


port contacts : List Contact
port props : List Prop
