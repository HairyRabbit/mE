{- mode: Elm -}
{- coding: utf-8 -}
module About.View where

import Html            exposing (..)
import Html.Attributes exposing (..)
import Util.Class      exposing (class2)
import Util.Image      exposing (image)
import About.Model exposing (Model)
import About.Action exposing (Action(..))
import Logo.View       as Logo
import Nav.View        as Nav

import Icon.View as Icon
import Icon.Model exposing (nodejs, javascript, es6)
import Profile.Model exposing (Contact, Prop)
import Icon.Model exposing (Lang)

import Debug

view : Signal.Address Action -> Model -> Html
view address model =
  main' [ class "about" ]
    [ section [ class "about-main" ]
        [ topRightView
        , meView model
        , findmeView model.contacts
        -- , friendsView
        ]
    ]

topRightView : Html
topRightView =
  section [ class "about-tr" ]
    [ section [ class "about-header" ] [ Logo.view Logo.Right "About" ]
    , nav [ class "about-nav" ] Nav.view
    ]


meView : Model -> Html
meView model =
  section [ class "about-me" ]
    [ photoView model.me.avatar
    , div []
        [ propView
        , jobView
        , section [ class "about-langs" ] [ Icon.langsView model.langs model.me.langs ]
        ]
    , treeView
    , propsView model.props
    ]


photoView : String -> Html
photoView path =
  section [ class2 "none-select" "blog-photo" ]
    [ section [ class "photo" ] [ image path ]
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


propsView : List Prop -> Html
propsView props =
  let
    prop' prop =
      div [ class2 "props" "props-2" ]
        [ span [] [ text <| prop.name ++ ":" ]
        , section [] <| List.map prop'' prop.value
        ]

    prop'' value =
      div [ class "props-val"]
        [ text value ]

    title =
      [div [ class2 "props" "props-1" ] [ text "props:" ]]
  in
    section [ class "about-props" ] <| title ++ List.map prop' props


headerView : String -> Html
headerView str =
  header [ class "about-title" ]
    [ text str ]

{--    
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

--}


findmeView : List Contact -> Html
findmeView contacts =
  let
    blockItem contact =
      li [ class "block" ] [ blockView contact.path contact.href contact.name contact.content ]
  in
    section [ class "about-section" ]
      [ headerView "Find me ..."
      , ul [ class "list-rs" ] <| List.map blockItem contacts
      ]


blockView : String -> String -> String -> String -> Html
blockView path url str1 str2 =
  a
    [ class "block-con"
    , href url
    ]
    [ section [ class "block-pic" ]
        [ image path ]
    , section [ class "block-title" ]
        [ text str1 ]
    , section [ class "block-content" ]
        [ text str2 ]
    ]

