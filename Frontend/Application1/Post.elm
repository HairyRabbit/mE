module Post where

{-| Post 模块

用于博客文章的各种操作，封装了所有Ajax请求，包括:

1.根据 isTop 属性获取置顶的 posts
2.获取 posts 列表
3.根据 id 获取特定 post

其请求地址分别为:

1.GET /posts?isTop=eq.true
2.GET /posts?order=date.desc
3.Get /posts?id=eq.1

所以将有至少3个view来显示数据，分别用于:

1.首页面
2.列表页
3.详情页

-}


import Html                exposing (..)
import Html.Attributes     exposing (..)
import Effects             exposing (Effects)
import Json.Decode as Json exposing ((:=))
import Util.Classes        exposing (class2)
import Http
import Task
import String

import Debug exposing (log)



-- Model

type alias Post =
  { id    : String
  , title : String
  , date  : String
  , intro : String
  , isTop : Bool
  , path  : String
  }

type alias Model = List Post



-- Action
-- 这里这么全部装进 List 是为了以后需要，万一做个幻灯片什么的
-- 而且后面只要用head取第一个就好了

type Action
  = NoOp
  | GetTopPosts (Maybe Model)
  | GetPosts    (Maybe Model)
  | GetPost     (Maybe Model)



-- Effects

-- @Todo apiPath 应该从配置port读取
apiPath : String
apiPath = "http://localhost:4000/api/v1/posts"

-- 读取置顶的文章简介
-- 这里传入空字串是为了方便，下同
reqTopPostsUrl : String -> String
reqTopPostsUrl _ = Http.url apiPath [("isTop", "eq.true")]

-- 读取列表
reqPostListUrl : String -> String
reqPostListUrl _ = Http.url apiPath [("order", "date.desc")]

-- 读取具体文章
reqPostByIdUrl : String -> String
reqPostByIdUrl id = Http.url apiPath [("id", "eq." ++ id)]

-- 反序列化 Json 用于 Http.get
decoder : Json.Decoder Model
decoder =
  Json.list <| Json.object6 Post
  ("id"    := Json.string)
  ("title" := Json.string)
  ("date"  := Json.string)
  ("intro" := Json.string)
  ("isTop" := Json.bool)
  ("path"  := Json.string)

-- 从服务器获取数据，需要 url id 和 对应的 Action
getData : String -> (String -> String) -> (Maybe Model -> Action) -> Effects Action
getData id url action =
  Http.get decoder (url id)
    |> Task.toMaybe
    |> Task.map action
    |> Effects.task

getTopPosts : Effects Action
getTopPosts =
  getData "" reqTopPostsUrl GetTopPosts

getPostList : Effects Action
getPostList =
  getData "" reqPostListUrl GetPosts

getPost : String -> Effects Action
getPost id =
  getData id reqPostByIdUrl GetPost



-- Init

initTopPosts : (Model, Effects Action)
initTopPosts = ([], getTopPosts)

initPosts : (Model, Effects Action)
initPosts = ([], getPostList)

initPost : String -> (Model, Effects Action)
initPost id = ([], getPost id)



-- Update

noneModel : (Model, Effects Action)
noneModel = ([], Effects.none)

matchModel : Maybe Model -> (Model, Effects Action)
matchModel posts =
  case posts of
    Just m ->
      (m, Effects.none)
    Nothing ->
      noneModel

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    GetTopPosts posts ->
      matchModel posts

    GetPosts posts ->
      (model, getPostList)

    GetPost post ->
      matchModel post

    _ ->
      noneModel


-- View

topPostsView : Signal.Address Action -> Model -> Html
topPostsView address model =
  case (List.head model) of
    Just post ->
      section
        [ class2 "md" "top-posts" ]
        [ h1 []
            [ a [ href "#"]
                [ text post.title ]
            ]
        , p [ class "date" ] [ text post.date ]
        , p [] [ text post.intro ]
        ]
    Nothing ->
      section [] [ text "Loading..." ]

postView : String -> Signal.Address Action -> Model -> Html
postView id address model =
  case (List.head model) of
    Just post ->
      section
        [ class2 "md" "top-posts" ]
        [ h1 []
            [ a [ href "#"]
                [ text post.title ]
            ]
        , p [ class "date" ] [ text post.date ]
        , p [] [ text post.intro ]
        ]
    Nothing ->
      section [] [ text "Loading..." ]
