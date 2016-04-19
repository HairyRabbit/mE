module Blog.View where

import Html            exposing (..)
import Html.Attributes exposing (..)
import Markdown
import Blog.Action     exposing (Action(..))
import Blog.Model      exposing (Model)

import Logo.View   as Logo
import Nav.View    as Nav
import Rabbit.View as Rabbit

import Util.DateFmter exposing (dateFmter)
import Util.Class     exposing (class2)

import Debug exposing (log)

view : Signal.Address Action -> Model -> Html
view address model =
  let
    
    main =
      section
        [ class "blog-main" ]
        [ section
            [ class "md" ]
            [ Markdown.toHtml model.content ]
        ]

    top =
      header
        [ class "blog-top" ]
        [ section
            [ class "blog-header" ]
            [ header [ class "title" ] [ text model.post.title ]
            , section [ class "date" ] [ text <| dateFmter model.post.date ]
            ]
        ]
        
    left =
       aside
         [ class "blog-left" ]
         [ section
             []
             [ section
                 [ class "" ]
                 [ Logo.view Logo.Right "Blog"
                 , nav [ class "blog-nav" ] Nav.view
                 , section
                     [ class "blog-logo" ]
                     [ Rabbit.view ]
                 ]
             ]
         ]
       
    
  in
    main'
      [ class "blog" ]
      [ main
      , top
      , left
      ]
