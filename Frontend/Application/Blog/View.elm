module Blog.View where

import Html        exposing (..)
import Html.Attributes exposing (..)
import Markdown
import Blog.Action exposing (Action(..))
import Blog.Model  exposing (Model)

import Logo.View as Logo

import Util.DateFmter exposing (dateFmter)
import Util.Class     exposing (class2)

import Debug exposing (log)

view : Signal.Address Action -> Model -> Html
view address model =
  let
    
    main =
      section
        [ class2 "con-blog-cen" "con-blog-main" ]
        [ section
            [ class2 "md" "con-md" ]
            [ Markdown.toHtml model.content ]
        ]

    top =
      section
        [ class "con-blog-header" ]
        [ section
            [ class "con-blog-cen" ]
            [ header [ class "title" ] [ text model.post.title ]
            , section [ class "date" ] [ text <| dateFmter model.post.date ]
            ]
        ]
        
    left =
       section
         [ class "con-blog-left" ]
         [ section
             [ class "con-blog-cen" ]
             [ section
                 [ class "" ]
                 [ Logo.view "Blog"
                 , div [] [ text "Home IO" ]
                 , div [] [ text "Note On" ]
                 , div [] [ text "About Me" ]
                 ]
             ]
         ]
       
    
  in
    main'
      [ class "con-blog" ]
      [ main
      , top
      , left
      ]
