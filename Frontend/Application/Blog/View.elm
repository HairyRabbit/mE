module Blog.View (view) where

{-| View

文章详情，要用 markdown 转义

@todos
动画切换效果

-}

import Markdown
import Html            exposing (..)
import Html.Attributes exposing (..)
import Blog.Action     exposing (Action(..))
import Blog.Model      exposing (Model)
import Util.DateFmter  exposing (dateFmter)
import Util.Class      exposing (class2)
import Logo.View       as Logo
import Nav.View        as Nav
import Rabbit.View     as Rabbit



view : Signal.Address Action -> Model -> Html
view address model =
  let
    main =
      section [ class "blog-main" ]
        [ section [ class "md" ] [ Markdown.toHtml model.content ]
        ]

    top =
      header [ class "blog-top" ]
        [ section [ class "blog-header" ]
            [ header [ class "title" ] [ text model.post.title ]
            , section [ class "date" ] [ text <| dateFmter model.post.date ]
            ]
        ]

    left =
       aside [ class "blog-left" ]
         [ section []
             [ section []
                 [ Logo.view Logo.Right "Blog"
                 , nav [ class "blog-nav" ] Nav.view
                 , section [ class "blog-logo" ] [ Rabbit.view ]
                 ]
             ]
         ]
  in
    main' [ class "blog" ]
      [ main
      , top
      , left
      ]
