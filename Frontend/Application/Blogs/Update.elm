module Blogs.Update where

import Effects       exposing (Effects)
import Blogs.Model   exposing (Model)
import Blogs.Action  exposing (Action(..))

import List exposing (take, drop, length)
import Debug


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    OnFetched str ->
      let
        curr =
          model.current
        to =
          curr + model.size
      in
        case str of
          Just posts ->
            ( { model |
                  posts = posts,
                  currPosts = takeRange curr to posts
              }
            , Effects.none
            )
          Nothing ->
            (model, Effects.none)

    NextPosts ->
      let
        curr =
          if model.current + model.size >= length model.posts
          then model.current
          else model.current + model.size
        to =
          curr + model.size
      in
        ( { model |
              currPosts = takeRange curr to model.posts,
              current = curr
          }
        , Effects.none
        )

    PrevPosts ->
      let
        curr =
          case model.current of
            0 ->
              0
            _ ->
              model.current - model.size
        to =
          curr + model.size
      in
        ( { model |
              currPosts = takeRange curr to model.posts,
              current   = curr
          }
        , Effects.none
        )
    NoOp ->
      (model, Effects.none)


takeRange : Int -> Int -> List a -> List a
takeRange a b =
  drop a >> take b
