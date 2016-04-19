module Blogs.View (view) where

{-| View

文章博客列表，采用分页的形式显示列表

@todos
动画切换效果

-}

import Html            exposing (..)
import Html.Attributes exposing (..)
import Html.Events     exposing (onClick)
import Blogs.Action    exposing (Action(..))
import Blogs.Model     exposing (Model)
import Post.Model      exposing (Post)
import Util.DateFmter  exposing (dateFmter2)
import Util.Class      exposing (class2)
import Logo.View       as Logo
import Nav.View        as Nav



view : Signal.Address Action -> Model -> Html
view address model =
  let
    top =
      header [ class "blogs-top" ]
        [ section [ class "blogs-header" ] [ Logo.view Logo.Left "Blog" ]
        , nav [ class "blogs-nav" ] Nav.view
        ]

    controller classname action =
      span [ class classname
           , onClick address action
           ] []

    body =
      section [ class "blogs-main" ]
        [ ul [ class "list-rs" ] <| postsView model
        , div [ class "blogs-more" ]
            [ controller "blogs-prev" PrevPosts
            , controller "blogs-next" NextPosts
            ]
        ]
  in
    main'
      [ class "blogs" ]
      [ top
      , body
      ]


postsView : Model -> List Html
postsView model =
  let
    from =
      model.current
    to =
      from + model.size
  in
    model.posts
      |> takeRange from to
      |> List.map postView


postView : Post -> Html
postView post =
  li [ class "blogs-item" ]
    [ Nav.bloglinker post.id
        [ span [ class "blogs-date" ]  [ text <| dateFmter2 post.date ]
        , span [ class "blogs-title" ] [ text post.title ]
        ]
    ]


takeRange : Int -> Int -> List a -> List a
takeRange a b =
  List.drop a >> List.take b
