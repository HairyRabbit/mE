module About.View where

import Html            exposing (..)
import Html.Attributes exposing (..)
import Util.Class      exposing (class2)
import Util.Image      exposing (image)
import Logo.View       as Logo
import Nav.View        as Nav



view : Html
view =
  main' [ class "about" ]
    [ topRightView
    , meView
    , friendsView
    ]

topRightView : Html
topRightView =
  section [ class "about-tr" ]
    [ section [ class "about-header" ] [ Logo.view Logo.Right "About" ]
    , nav [ class "about-nav" ] Nav.view
    ]


meView : Html
meView =
  section [ class "about-me" ]
    [ photoView
    , propView
    , treeView
    ]
      
photoPath : String
photoPath =
  "./Image/photo.jpg"
    

photoView : Html
photoView =
  section [ class2 "none-select" "blog-photo" ]
    [ section [ class "photo" ] [ image photoPath ]
    ]


propView : Html
propView =
  section [ class "about-prop" ]
    [ span [ class "about-div" ] [ text "{" ]
    , span [] [ text "Age " ]
    , span [ class "about-age" ] [ text "17" ]
    , span [] [ text "," ]
    , span [ class "about-sex" ] [ text "" ]
    , span [ class "about-div" ] [ text "}" ]
    ]


treeView : Html
treeView =
  section [ class "about-tree" ]
    [ section [ class "tree" ] [ image "./Image/tree.svg" ]
    ]

    
friendsView : Html
friendsView =
  section [ class "about-friends" ]
    [ header [ class "about-title" ]
        [ text "Friends are all the Hentai..." ]

    , ul [ class "list-rs" ]
        [ li [] [ userView ]

        ]
    ]


userView : Html
userView =
  section [ class "friend" ]
    [ div [ class "friend-left" ]
        [ div [ class "friend-avatar" ]
            [ image photoPath ]

        ]
    , div [ class "friend-right" ]
        [ header [ class "friend-name" ]
            [ text "Test User" ]
        , section [ class "friend-link" ]
            [ text "github.com/test" ]
        , section [ class "friend-intro" ]
            [ text "喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉" ]
        ]
    ]
