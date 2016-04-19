module Home.Effects where

import Http
import Task                exposing (Task)
import Effects             exposing (Effects)
import Json.Decode as Json exposing ((:=))
import Home.Action         exposing (Action(..))
import Home.Model          exposing (Model)
import Post.Model          exposing (Post)



-- Effects

apiURL : String
apiURL = "http://localhost:4000/api/v1/posts/"


encodeURL : String
encodeURL =
  Http.url apiURL [("isTop", "eq.true")]


fetchTop : Effects Action
fetchTop =
  Http.get decoder encodeURL
      |> Task.toMaybe
      |> Task.map OnFetched
      |> Effects.task


-- Decoder

decodePost : Json.Decoder Post
decodePost =
  Json.object4 Post
    ("id"      := Json.string)
    ("title"   := Json.string)
    ("date"    := Json.string)
    ("intro"   := Json.string)


decoder : Json.Decoder Model
decoder =
  Json.object1 Model decodePost
