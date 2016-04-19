module Blogs.Effects (fetchPosts) where

{-| Effects

博客列表，Ajax 请求数据

-}

import Http
import Effects      exposing (Effects)
import Blogs.Action exposing (Action(..))
import Blogs.Model  exposing (Model)
import Post.Model   exposing (Post)
import Post.Effects exposing (apiURL, fetch, decodePost)
import Json.Decode  as Json



(=>) = (,)


encodeURL : String
encodeURL =
  Http.url apiURL ["order" => "date.desc"]


fetchPosts : Effects Action
fetchPosts =
  fetch encodeURL decoder OnFetched


decoder : Json.Decoder (List Post)
decoder =
  Json.list decodePost
