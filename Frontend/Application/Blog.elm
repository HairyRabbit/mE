module Blog (..) where

import Html         exposing (..)
import Task         exposing (Task)
import Effects      exposing (Effects)
import Http
import Json.Decode as Json exposing ((:=))

import Post


-- ACTION
type Action
  = NoOp
  | Request Post.PostId
  | Response (Maybe Post.Post)


-- MODEL

type alias Model =
  { post : Post.Post
  }

initModel : Model
initModel =
  { post = Post.initPost
  }

init : Post.PostId -> (Model, Effects Action)
init id =
  (initModel, fetch id)


-- UPDATE

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Request id ->
      (model, fetch id)
    Response act ->
      (model, Effects.none)
    _ ->
      (model, Effects.none)


-- VIEW
view : Signal.Address Action -> Model -> Post.PostId -> Html
view address model id =
  div
    []
    [ span [] [ text id ]
    , span [] [ text model.post.title ]
    ]


-- Effects

fetch : String -> Effects Action
fetch id =
  Http.get decoder ("http://location:4000/api/v1/post/" ++ id)
    |> Task.toMaybe
    |> Task.map Response
    |> Effects.task


decoder : Json.Decoder Post.Post
decoder =
  Json.object2 Post.Post
    ("id"    := Json.string)
    ("title" := Json.string)  

      
