module Blog (..) where

import Html         exposing (..)
import Task         exposing (Task)
import Effects      exposing (Effects)

import Post


-- ACTION
type Action
  = NoOp


-- MODEL

type alias Model =
  { post : Post.Post
  }

initModel : Model
initModel =
  { post = Post.initPost
  }


-- UPDATE

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NoOp ->
      (model, Effects.none)


-- VIEW
view : Signal.Address Action -> Model -> Post.PostId -> Html
view address model id =
  div
    []
    [ span [] [ text id ]
    , span [] [ text model.post.title ]
    ]
