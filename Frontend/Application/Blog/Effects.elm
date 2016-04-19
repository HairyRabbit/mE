module Blog.Effects (fetchPost) where

{-| Effects

博客文章，请求 markdown 数据

@todos
增加评论，及评论列表

-}

import Http
import Effects      exposing (Effects)
import Blog.Action  exposing (Action(..))
import Blog.Model   exposing (Model)
import Post.Model   exposing (Post)
import Post.Effects exposing (apiURL, fetch, decodePost)
import Json.Decode  as Json



(=>) = (,)


encodeURL : String -> String
encodeURL id =
  Http.url apiURL ["id" => ("eq." ++ id)]


fetchPost : String -> Effects Action
fetchPost id =
  fetch (encodeURL id) decoder OnFetched


decodeContent : Json.Decoder String
decodeContent =
  Json.at ["content"] Json.string


decoder : Json.Decoder Model
decoder =
  Json.object2 Model decodePost decodeContent
