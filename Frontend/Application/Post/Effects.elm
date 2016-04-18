module Post.Effects where

import Post.Model          exposing (Post)
import Json.Decode as Json exposing ((:=))



-- Decoder

decodePost : Json.Decoder Post
decodePost =
  Json.object4 Post
    ("id"      := Json.string)
    ("title"   := Json.string)
    ("date"    := Json.string)
    ("intro"   := Json.string)
