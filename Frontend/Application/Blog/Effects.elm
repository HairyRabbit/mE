module Blog.Effects where

import Http
import Task                exposing (Task)
import Effects             exposing (Effects)
import Json.Decode as Json exposing ((:=))
import Blog.Model          exposing (PostID)
import Blog.Action         exposing (Action(..))

import Debug exposing (log)

apiURL : String
apiURL = "http://localhost:4000/api/v1/posts/"

encodeURL : PostID -> String
encodeURL id =
  Http.url apiURL [("id", "eq." ++ id)]

fetchPost : PostID -> Effects Action
fetchPost id =
  Http.get decoder (encodeURL id)
      |> Task.toMaybe
      |> Task.map (log "ctx")
      |> Task.map OnFetched
      |> Task.map (log "ctx")
      |> Effects.task

decoder : Json.Decoder String
decoder =
  Json.at ["data"] Json.string
