module Blog.Effects where

import Http
import Task                exposing (Task)
import Effects             exposing (Effects)
import Json.Decode as Json exposing ((:=))
import Blog.Action         exposing (Action(..))
import Blog.Model          exposing (Model)
import Post.Model exposing (Post)

import Debug exposing (log)

-- Effects

apiURL : String
apiURL = "http://localhost:4000/api/v1/posts/"

encodeURL : String -> String
encodeURL id =
  Http.url apiURL [("id", "eq." ++ id)]

fetchPost : String -> Effects Action
fetchPost id =
  Http.get decoder (encodeURL id)
      |> Task.toMaybe
      |> Task.map OnFetched
      |> Effects.task


-- Decoder

decodePost : Json.Decoder Post
decodePost =
  Json.object3 Post
    ("id"      := Json.string)
    ("title"   := Json.string)
    ("date"    := Json.string)

decodeContent : Json.Decoder String
decodeContent =
  Json.at ["content"] Json.string

decoder : Json.Decoder Model
decoder =
  Json.object2 Model decodePost decodeContent
