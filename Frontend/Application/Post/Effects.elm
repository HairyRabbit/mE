module Post.Effects where

{-| Effects

一套工具方法，请求数据和转义 Json

-}

import Http
import Task                exposing (Task)
import Effects             exposing (Effects)
import Post.Model          exposing (Post)
import Json.Decode as Json exposing ((:=))



(=>) = (,)


apiURL : String
apiURL = "/api/v1/post"


fetch : String -> Json.Decoder a -> (Maybe a -> b) -> Effects b
fetch url decoder action =
  let
    config =
      { verb    = "GET"
      , headers = ["Content-Type" => "application/json"]
      , url     = url
      , body    = Http.empty
      }
  in
    Http.send Http.defaultSettings config
      |> Http.fromJson decoder
      |> Task.toMaybe
      |> Task.map action
      |> Effects.task


decodePost : Json.Decoder Post
decodePost =
  Json.object6 Post
    ("id"       := Json.string)
    ("title"    := Json.string)
    ("datetime" := Json.string)
    ("istop"    := Json.bool)
    ("intro"    := Json.string)
    ("filepath" := Json.string)
