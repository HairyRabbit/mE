module Blog where

{-| Blog 显示 blog 文章

-}

import Html                exposing (..)
import Html.Attributes     exposing (..)
import Effects             exposing (Effects)
import Util.Classes        exposing (class2)
import Post

import Debug exposing (log)



-- Model

type alias Model =
  { posts : Post.Model }



-- Action

type Action
  = NoOp
  | ActionPost Post.Action



-- Update

update : Action -> Model -> (Model, Effects Action)
update action model = 
  case action of
    ActionPost act ->
      let
        (m, fx) = Post.update act model.posts
      in
        ( Model m
        , Effects.map ActionPost fx
        )

    NoOp ->
      (model, Effects.none)



-- Init

init : (Model, Effects Action)
init =
  let
    (m, fx) = Post.initPost
  in
    ( Model m
    , Effects.batch
        [ Effects.map ActionPost fx
        ]
    )
            


-- View
view : Signal.Address Action -> Model -> Html
view address model =
  main'
    []
    [ Post.postView (Signal.forwardTo address ActionPost) model.posts
    ]
