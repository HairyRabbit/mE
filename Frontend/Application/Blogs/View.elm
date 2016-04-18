module Blogs.View where

import Html            exposing (..)
import Html.Attributes exposing (..)
import Html.Events     exposing (onClick)
import Blogs.Action    exposing (Action(..))
import Blogs.Model     exposing (Model)

import Post.Model exposing (Post)

import Logo.View   as Logo
import Nav.View    as Nav
import Rabbit.View as Rabbit

import Util.DateFmter exposing (dateFmter2)
import Util.Class     exposing (class2)

import Debug exposing (log)

view : Signal.Address Action -> Model -> Html
view address model =
  let

    top =
      header
        [ class "blogs-top" ]
        [ section [ class "blogs-header" ] [ Logo.view Logo.Left "Blog" ]
        , nav [ class "blogs-nav" ] Nav.view
        ]

    main =
      section
        [ class "blogs-main" ]
        [ ul [ class "list-rs" ] <| List.map postView model.posts
        , div
            [ class "blogs-more" ]
            [ span [ class "blogs-prev"
                   , onClick address PrevPosts
                   ] []
            , span [ class "blogs-next"
                   , onClick address NextPosts
                   ] []
            ]
        ]
      
        
        
  in
    main'
      [ class "blogs" ]
      [ top
      , main
      ]


postView : Post -> Html
postView post =
  li
    [ class "blogs-item" ]
    [ a
      [ href <| "/blog/" ++ post.id ]
      [ span [ class "blogs-date" ] [ text <| dateFmter2 post.date ]
      , span [ class "blogs-title" ] [ text post.title ]
      ]
    ]
