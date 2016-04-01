module Hotspot.Init where

import Http
import Task
import Effects exposing (Effects)
import Json.Decode exposing ((:=), object3, string)
import Hotspot.Model  exposing (Model, initModel)
import Hotspot.Action exposing (Action(..))


init : (Model, Effects Action)
init =
  ( initModel
  , getHotspot
  )

requestURL : String
requestURL = "http://localhost:4000/api/v1/hotspot"

getHotspot : Effects Action
getHotspot =
  Http.get decodeData requestURL
    |> Task.toMaybe
    |> Task.map NewHotspot
    |> Effects.task

decodeData : Json.Decode.Decoder Model
decodeData =
  object3 Model
  ("title" := string)
  ("date"  := string)
  ("intro" := string)
