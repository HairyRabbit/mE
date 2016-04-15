module Post.Update where

import Http
import Task
import Effects     exposing (Effects)
import Json.Decode as Json exposing ((:=))


{-| Model -}

type alias Post =
  { id    : String
  , title : String
  , date  : String
  , intro : String
  , isHot : Boolean
  , path  : String
  }

type alias Model = List Post

initModel : List Model
initModel = []


type Action
  = NoOp
  | GetTopPosts (Maybe Model)
  | GetPosts (Maybe Model)
  | GetPost (Maybe Post)


init : (Model, Effects Action)
init = (initModel, getPost)


{-| Effects -}

apiPath : String
apiPath = "http://localhost:4000/api/v1/posts"

{-| Get posts

Get top posts
GET /posts?isTop=eq.true

Get posts list
GET /posts?order=date.desc

Get post by id
Get /posts?id=eq.1

-}

reqTopPostsUrl : String
reqTopPostsUrl = Http.url apiPath [("isTop", "eq.true")]

reqPostListUrl : String
reqPostListUrl = Http.url apiPath [("order", "date.desc")]

reqPostByIdUrl : String -> String
reqPostByIdUrl id = Http.url apiPath [("id", "eq." ++ id)]

decodeTopPosts : Json.Decoder Model
decodeTopPosts =
  Json.List <| Json.object4 Post
  ("id"    := Json.string)
  ("title" := Json.string)
  ("date"  := Json.string)
  ("intro" := Json.string)

decodePostList : Json.Decoder Model
decodePostList =
  Json.List <| Json.object3 Post
  ("id"    := Json.string)
  ("title" := Json.string)
  ("date"  := Json.string)

decodePost : Json.Decoder Post
decodePost =
  Json.object6 Post
  ("id"    := Json.string)
  ("title" := Json.string)
  ("date"  := Json.string)
  ("intro" := Json.string)
  ("isHot" := Json.bool)
  ("path"  := Json.string)

getData : String -> String -> Json.Decoder a -> Action -> Effects Action
getData id url decoder action =
  let
    urls =
      if String.isEmpty id
      then url
      else url id
  in
    Http.get decoder urls
      |> Task.toMaybe
      |> Task.map action
      |> Effects.task

getTopPosts : Effects Action
getTopPosts =
  getData "" reqTopPostsUrl decodeTopPosts GetTopPosts

getPostList : Effects Action
getPostList =
  getData "" reqPostListUrl decodePostList GetPosts

getPost : String -> Effects Action
getPost id =
  getData id reqPostByIdUrl decodePost GetPost


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    GetTopPosts posts ->
      case posts of
        Just d ->
          (d, Effects.none)
        Nothing ->
          (model, Effects.none)
    _ ->
      (model, Effects.none)
