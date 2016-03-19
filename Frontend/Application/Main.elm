module Main where

import Html exposing (..)
import Effects exposing (Never)
import StartApp exposing (App, start)
import Task exposing (Task)

import Application.Home exposing (init, update, view)


app =
  start { init = init
        , update = update
        , view = view
        , inputs = []
        }
    
main : Signal Html
main =
  app.html
    
port tasks : Signal (Task Never ())
port tasks =
  app.tasks
