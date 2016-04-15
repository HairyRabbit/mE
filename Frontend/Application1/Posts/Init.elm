module Posts.Init where

import Http
import Task
import Effects exposing (Effects)
import Json.Decode  as Json exposing ((:=))
import Posts.Model  exposing (Model, Post)
import Posts.Action exposing (Action(..))
import Debug exposing (log)

init : (Model, Effects Action)
init =
  ( []
  , getPosts
  )

requestURL : String
requestURL = "http://localhost:4000/api/v1/posts"

getPosts : Effects Action
getPosts =
  Http.get decodeData requestURL
    |> Task.toMaybe
    |> Task.map NewPosts
    |> Effects.task


decodeData : Json.Decoder Model
decodeData =
  Json.list <| Json.object3 Post
  ("id" := Json.string)
  ("title"  := Json.string)
  ("date" := Json.string)
