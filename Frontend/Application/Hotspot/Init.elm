module Hotspot.Init where

import Hotspot.Model  exposing (..)
import Hotspot.Action exposing (Action(..))
import Effects        exposing (..)
import Http
import Task
import Json.Decode as Json exposing ((:=))
import Debug exposing (log)


init : (Model, Effects Action)
init =
  ( { date = "", title = "", intro = "" }
  , getHotspot
  )

requestURL : String
requestURL = "http://localhost:4000/api/v1/hotspot"

getHotspot : Effects Action
getHotspot =
  Http.get decodeData requestURL
    |> Task.toMaybe
    |> Task.map (log "")
    |> Task.map NewHotspot
    |> task



decodeData : Json.Decoder Model
decodeData =
  Json.object3 Model
  ("title" := Json.string)
  ("date" := Json.string)
  ("intro"  := Json.string)
