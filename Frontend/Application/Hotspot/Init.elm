module Hotspot.Init where

import Hotspot.Model  exposing (..)
import Hotspot.Action exposing (Action(..))
import Effects
import Http
import Task
import Json.Decode exposing ((:=), object3, string)
import Debug exposing (log)


init : (Model, Effects.Effects Action)
init =
  ( Hotspot.Model.initModel
  , getHotspot
  )

requestURL : String
requestURL = "http://localhost:4000/api/v1/hotspot"

getHotspot : Effects.Effects Action
getHotspot =
  Http.get decodeData requestURL
    |> Task.toMaybe
    |> Task.map (log "")
    |> Task.map NewHotspot
    |> Effects.task

decodeData : Json.Decode.Decoder Model
decodeData =
  object3 Model
  ("title" := string)
  ("date"  := string)
  ("intro" := string)
