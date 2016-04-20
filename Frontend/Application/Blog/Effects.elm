module Blog.Effects (fetchPost, fetchContent) where

{-| Effects

博客文章，请求 markdown 数据

@todos
增加评论，及评论列表

-}

import Http
import Task         exposing (Task)
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


contentURL : String -> String
contentURL name =
  "/notes/" ++ name


fetchPost : String -> Effects Action
fetchPost id =
  fetch (encodeURL id) decoder OnFetched


fetchContent : String -> Effects Action        
fetchContent name =
  Http.getString (contentURL name)
      |> Task.toMaybe
      |> Task.map OnContentFetched
      |> Effects.task


decodeContent : Json.Decoder String
decodeContent =
  Json.at ["content"] Json.string


decoder : Json.Decoder (List Post)
decoder =
  Json.list decodePost
