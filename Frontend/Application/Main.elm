module Main (..) where

{-| Bootstrap



-}

import Html    exposing (..)
import Effects exposing (Effects, Never)
import Task
import StartApp
import Json.Encode   as Json


import App.Init      exposing (init)
import App.Input     exposing (inputs)
import App.Update    exposing (update)
import App.View      exposing (view)
import App.Model     exposing (Model)
import App.Port      exposing (Ports)
import Profile.Model exposing (Contact, Prop, Me)
import Icon.Model    exposing (Lang)
import Routing.Port  as Routing

ports : Ports
ports =
  Ports contacts props langs me

app : StartApp.App Model
app =
  StartApp.start
    { init   = init ports
    , inputs = inputs
    , update = update
    , view   = view
    }

main : Signal Html
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


port model : Signal String
port model =
  Signal.map toString app.model


port contacts : List Contact
port props : List Prop
port langs : List Lang
port me : Me
