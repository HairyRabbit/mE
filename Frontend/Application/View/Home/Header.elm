module Application.View.Home.Header (headerView) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Flex exposing (..)
import Application.View.Home.Logo exposing (logoView)
import Application.View.Home.Greet exposing (greetView)
import Application.View.Home.Intro exposing (introView)

headerView : Html
headerView =
  header [ headerStyle ]
           [ section [ headerLeftStyle ]
               [ logoView ]
           , section [ headerRightStyle ]
               [ greetView
               , introView
               ]
           ]

headerStyle : Attribute
headerStyle =
  style <| [ ("padding","0 0 20rem 0")
           ] ++ flexStyle flex

headerLeftStyle : Attribute
headerLeftStyle =
  style <| flexStyle flexCenter

headerRightStyle : Attribute
headerRightStyle =
  style <| flexStyle flexColumn
