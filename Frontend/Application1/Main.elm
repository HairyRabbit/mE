module Main where

{-| 一切都将从这里开始 -}

import Html     exposing (Html)
import Effects  exposing (Never)
import Task     exposing (Task)
import StartApp exposing (start)

import Model    exposing (Model)
import Init     exposing (init)
import Update   exposing (update)
import View     exposing (view)
import Input    exposing (input)


{-| App config -}
app : StartApp.App Model
app =
  start { init   = init path
        , update = update
        , view   = view
        , inputs = input
        }

main : Signal Html
main = app.html


{-| Port throw -}
port tasks : Signal (Task Never ())
port tasks = app.tasks

port path : String
