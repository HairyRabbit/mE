module Blogs.Effects where

import Http
import Task                exposing (Task)
import Effects             exposing (Effects)
import Json.Decode as Json exposing ((:=))
import Blogs.Action        exposing (Action(..))
import Blogs.Model         exposing (Model)
import Post.Model          exposing (Post)

import Debug


apiURL : String
apiURL = "http://localhost:4000/api/v1/posts/"

encodeURL : String
encodeURL =
  Http.url apiURL [("order", "date.desc")]


fetchPosts : Effects Action
fetchPosts =
  let
    config =
      { verb = "GET"
      , headers =
          [ ("Content-Type", "application/json")
          , ("Range-Unit", "items")
          , ("Content-Range", "0-5")
          ]
      , url = encodeURL
      , body = Http.empty
      }
  in
    Http.send Http.defaultSettings config
      |> Http.fromJson decoder
      |> Task.toMaybe
      |> Task.map OnFetched
      |> Effects.task

nextPosts : Int -> Effects Action
nextPosts curr =
  let
    _ =
      Debug.log "curr" curr

    range1 =
      toString <| curr + 5

    range2 =
      toString <| curr + 10
    
    config =
      { verb = "GET"
      , headers =
          [ ("Content-Type", "application/json")
          , ("Range-Unit", "items")
          , ("Content-Range", range1 ++ "-" ++ range2)
          ]
      , url = encodeURL
      , body = Http.empty
      }
  in
    Http.send Http.defaultSettings config
      |> Http.fromJson decoder
      |> Task.toMaybe
      |> Task.map OnNextFetched
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
