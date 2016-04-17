module Home.View where

import Html            exposing (..)
import Html.Attributes exposing (..)
import Home.Action     exposing (Action(..))
import Home.Model      exposing (Model)
import Util.Class      exposing (class2)
import Util.Image      exposing (image)
import Util.DateFmter  exposing (dateFmter)

import Logo.View as Logo
import Nav.View  as Nav



view : Signal.Address Action -> Model -> Html
view address model =
  main'
    [ class "home" ]
    [ leftView model
    , rightView
    ]


imagePath : String
imagePath =
  "./Image/Just-me.jpg"


rightView : Html
rightView =
  aside
    [ class "home-left" ]
    [ section
        [ class "home-header" ]
        [ Logo.view Logo.Left "Hi" ]
    , imageView
    , nav
        [ class "home-nav" ]
        [ Nav.view "/" "Home IO" "e"
        , Nav.view "/blog" "Note On" "e"
        , Nav.view "/about" "About Me" "t"
        ]
    ]


leftView : Model -> Html
leftView model =
  section
    [ class "home-right" ]
    [ section
        [ class "home-post" ]
        [ header [ class "title" ]
            [ a [ href <| "/blog/" ++ model.post.id ]
                [ text model.post.title ]
            ]
        , p [ class "date" ] [ text <| dateFmter model.post.date ]
        , p [ class "intro" ] [ text model.post.intro ]
        ]
    ]

imageView : Html
imageView =
  section
    [ class2 "none-select" "home-justme" ]
    [ section [ class "justme" ] [ image imagePath ]
    ]


  
