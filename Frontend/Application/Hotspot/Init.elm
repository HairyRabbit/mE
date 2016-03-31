module Hotspot.Init where

import Hotspot.Model  exposing (..)
import Hotspot.Action exposing (Action(..))
import Effects        exposing (..)
import Http
import Task


init : (Model, Effects Action)
init =
  ( { date = "", title = "", intro = "" }
  , getHotspot
  )

requestURL : String
requestURL = "http://localhost:4000/api/v1/hotspot"

getHotspot : Effects Action
getHotspot =
  Http.getString requestURL
    |> Task.toMaybe
    |> Task.map NewHotspot
    |> task
