module Blogs.Update (update) where

{-| Update

文章博客列表，采用了前端软分页的形式

* OnFetched 向服务器请求数据，并填入 posts
* NextPosts 下一页，计算 current
* PrevPosts 上一页

-}

import Effects      exposing (Effects)
import Blogs.Model  exposing (Model)
import Blogs.Action exposing (Action(..))



update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    OnFetched str ->
      case str of
        Just posts ->
          ( { model | posts = posts }
          , Effects.none
          )
        Nothing ->
          (model, Effects.none)

    NextPosts ->
      let
        curr =
          if model.current + model.size >= List.length model.posts
          then model.current
          else model.current + model.size
      in
        ( { model | current = curr }
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
      in
        ( { model | current   = curr }
        , Effects.none
        )

    NoOp ->
      (model, Effects.none)
