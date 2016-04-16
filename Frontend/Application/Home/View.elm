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
    [ class "con-home" ]
    [ leftView model
    , rightView
    ]


imagePath : String
imagePath =
  "./Image/Just-me.jpg"


rightView : Html
rightView =
  aside
    [ class "con-home-item" ]
    [ section [ class "logo-home" ] [ Logo.view Logo.Left "Hello" ]
    , imageView
    , nav
        [ class "nav-home" ]
        [ Nav.view "/" "Home IO" "e"
        , Nav.view "/blog" "Note On" "e"
        , Nav.view "/about" "About Me" "t"
        ]
    ]


leftView : Model -> Html
leftView model =
  section
    [ class "con-home-item" ]
    [ section
        [ class2 "md" "top-posts" ]
        [ h1 [ style [("display", "block")] ]
            [ a [ ]
                [ text model.post.title ]
            ]
        , p [ class "date" ] [ text <| dateFmter model.post.date ]
        , p [ ] [ text model.post.intro ]
        ]
    ]

imageView : Html
imageView =
  section
    [ class2 "none-select" "flex-con" ]
    [ section [ class "img-home" ] [ image imagePath ]
    ]


  
