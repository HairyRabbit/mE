module Home.Effects (fetchTop) where

{-| Effects

首页，请求热点文章

@todos
请求列表来做幻灯片

-}

import Http
import Effects      exposing (Effects)
import Home.Action  exposing (Action(..))
import Home.Model   exposing (Model)
import Post.Model   exposing (Post)
import Post.Effects exposing (apiURL, fetch, decodePost)
import Json.Decode  as Json



(=>) = (,)


encodeURL : String
encodeURL =
  Http.url apiURL ["isTop" => "eq.true"]


fetchTop : Effects Action
fetchTop =
  fetch encodeURL decoder OnFetched


decoder : Json.Decoder Model
decoder =
  Json.object1 Model decodePost
