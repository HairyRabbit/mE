module Blog.Update (update) where

{-| Update

文章详情

* OnFetched 向服务器请求数据，并入 model

-}

import Effects      exposing (Effects)
import Blog.Model   exposing (Model)
import Blog.Action  exposing (Action(..))
import Blog.Effects exposing (fetchContent)


update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    OnFetched str ->
      case str of
        Just mod ->
          case mod of
            xs::mod ->
              ( { model | post = xs }
              , fetchContent xs.filepath
              )
            _ ->
              (model, Effects.none)
        Nothing ->
          (model, Effects.none)
            
    OnContentFetched str ->
      case str of
        Just ctx ->
          ( { model | content = ctx }
          , Effects.none
          )
        Nothing ->
          (model, Effects.none)
      
    NoOp ->
      (model, Effects.none)
