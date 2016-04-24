{- mode: Elm -}
{- coding: utf-8 -}
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
    [ section [ class "about-main" ]
        [ topRightView
        , meView
        , findmeView
        , friendsView
        ]
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
    , div []
        [ propView
        , jobView
        , section [ class "about-langs" ] [ langsView ]
        ]
    , treeView
    , propsView
    ]
      
photoPath : String
photoPath =
  "./Image/photo.jpg"
    

photoView : Html
photoView =
  section [ class2 "none-select" "blog-photo" ]
    [ section [ class "photo" ] [ image photoPath ]
    ]


jobView : Html
jobView =
  section [ class "about-job" ]
    [ span [ class "about-div" ] [ text "$>" ]
    , span [] [ text "Frontend Developer"]
    ]


propView : Html
propView =
  section [ class "about-info" ]
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


propsView : Html
propsView =
  section [ class "about-props" ]
    [ div [ class2 "props" "props-1" ] [ text "props:" ]
    , div [ class2 "props" "props-2" ] [ text "food:" ]
    , div [ class2 "props-val" "props-3" ] [ text "最爱吃肉" ]
    , div [ class2 "props-val" "props-3" ] [ text "会煮咖啡" ]
    , div [ class2 "props-val" "props-3" ] [ text "烹饪满级" ]
    , div [ class2 "props" "props-2" ] [ text "music:" ]
    , div [ class2 "props-val" "props-3" ] [ text "轻音乐" ]
    , div [ class2 "props-val" "props-3" ] [ text "偶尔电音" ]
    , div [ class2 "props" "props-2" ] [ text "character:" ]
    , div [ class2 "props-val" "props-3" ] [ text "爱着急" ]
    , div [ class2 "props-val" "props-3" ] [ text "常常闹别扭" ]
    ]


headerView : String -> Html
headerView str =
  header [ class "about-title" ]
    [ text str ]

    
friendsView : Html
friendsView =
  section [ class "about-section" ]
    [ headerView "Friends & Hentais ..."
    , ul [ class "list-rs" ]
        [ li [] [ userView ]
        , li [] [ userView ]
        ]
    ]
    


userView : Html
userView =
  section [ class "media" ]
    [ div [ class "media-left" ]
        [ div [ class "media-avatar" ]
            [ image photoPath ]

        ]
    , div [ class2 "media-right" "md" ]
        [ section []
            [ dt [] [ text "Test User" ]
            , div [ class "media-link" ]
                [ a [ href "https://github.com/test" ]
                    [ small [] [ text "github.com/test" ]
                    ]
                ]
            , dd [] [ text "喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉喜欢吃肉" ]
            ]
        , langsView
        ]
    ]


langsView : Html
langsView =
  section [ class "langs" ]
    [ div [ class "lang" ] [ image "./Image/Lang/nodejs.png" ]
    , div [ class "lang" ] [ image "./Image/Lang/react.svg" ]
    , div [ class "lang" ] [ image "./Image/Lang/java.svg" ]
    ]

langView : String -> Html
langView str =
  div [ class "lang" ] [ image str ]
  


findmeView : Html
findmeView =
  section [ class "about-section" ]
    [ headerView "Find me ..."
    , ul [ class "list-rs" ]
        [ li [ class "block" ] [ blockView photoPath "QQ number" "344292172" ]
        , li [ class "block" ] [ blockView photoPath "GitHub" "Rabbit" ]
        , li [ class "block" ] [ blockView photoPath "Mail" "yfhj1990@hotmail" ]
        , li [ class "block" ] [ blockView photoPath "QQ group" "Elm" ]
        ]
    ]


blockView : String -> String -> String -> Html
blockView path str1 str2 =
  a
    [ class "block-con"
    , href "#"
    ]
    [ section [ class "block-pic" ]
        [ image path ]
    , section [ class "block-title" ]
        [ text str1 ]
    , section [ class "block-content" ]
        [ text str2 ]
    ]
