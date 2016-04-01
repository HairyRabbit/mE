module Main where

import History
import Html exposing (..)
import Effects exposing (Never)
import StartApp exposing (App, start)
import Task exposing (Task)

{-

import Application.Router as Router

app =
  start { init = Router.init path
        , update = Router.update
        , view = Router.view
        , inputs = [ Signal.map Router.PathChange History.path ]
        }
-}

{-
import Home.Init   exposing (..)
import Home.Update exposing (..)
import Home.View   exposing (..)
app =
  start { init = init
        , update = update
        , view = view
        , inputs = []
        }
-}

import Init exposing (init)
import Update exposing (update)
import View exposing (view)
import Action exposing (Action(..))
import Router.Update exposing (routeInput)

app =
  start { init = init path
        , update = update
        , view = view
        , inputs = [ routeInput ]
        }
    

main : Signal Html
main = app.html

port tasks : Signal (Task Never ())
port tasks = app.tasks

port path : String
