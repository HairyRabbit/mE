module Application.View.Home.Header (headerView) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Flex exposing (..)
import Application.View.Header.Logo as Logo
import Application.View.Header.Greet as Greet
import Application.View.Header.Intro as Intro

headerView : Html
headerView =
  header [ headerStyle ]
           [ section [ headerLeftStyle ]
               [ Logo.view ]
           , section [ headerRightStyle ]
               [ Greet.view "Welcome"
               , Intro.view
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
