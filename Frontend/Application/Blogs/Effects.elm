module Blogs.Effects where

import Http
import Task                exposing (Task)
import Effects             exposing (Effects)
import Json.Decode as Json exposing ((:=))
import Blogs.Action        exposing (Action(..))
import Blogs.Model         exposing (Model)
import Post.Model          exposing (Post)



apiURL : String
apiURL = "http://localhost:4000/api/v1/posts/"

encodeURL : String
encodeURL =
  Http.url apiURL [("order", "date.desc")]

fetchPosts : Effects Action
fetchPosts =
  Http.get decoder encodeURL
      |> Task.toMaybe
      |> Task.map OnFetched
      |> Effects.task

nextPosts : Effects Action
nextPosts =
  Http.get decoder encodeURL
      |> Task.toMaybe
      |> Task.map OnFetched
      |> Effects.task

prevPosts : Effects Action
prevPosts =
  Http.get decoder encodeURL
      |> Task.toMaybe
      |> Task.map OnFetched
      |> Effects.task


-- Decoder

decodePost : Json.Decoder (List Post)
decodePost =
  Json.list <| Json.object4 Post
    ("id"      := Json.string)
    ("title"   := Json.string)
    ("date"    := Json.string)
    ("intro"   := Json.string)

decoder : Json.Decoder (List Post)
decoder =
  decodePost
