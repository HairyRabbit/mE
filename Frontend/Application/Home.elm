module Application.Home (init, update, view) where

import Graphics.Element exposing (..)
import Graphics.Collage exposing (collage, rect, filled, move)
import Color exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Effects exposing (Effects, Never)
import Task

import Application.Style.Flex exposing (..)
import Application.View.Home.Header exposing (headerView)
import Application.View.Home.Hello exposing (helloView)
import Application.View.Rect exposing (rectGroupView1)


type alias Model = Int

init : (Model, Effects Int)
init = (0, Effects.none)

update : Int -> Model -> (Model, Effects Int)
update action model = (model, Effects.none)

view : Signal.Address Int -> Model -> Html
view address model =
  main' [ mainStyle ]
          [ section [ mainLeftStyle ]
              [ header [ noticeStyle ]
                  [ text "Comming Soon ... " ]
              , rectGroupView1 "70%" "70%" 0
              , rectGroupView1 "20%" "10%" 45
              ]
          , section [ mainRightStyle ]
              [ headerView
              -- , navView
              , helloView
              ]
          ]


mainStyle : Attribute
mainStyle =
  style <| [ ("min-width", "64rem")
           , ("min-height", "40rem")
           , ("position", "relative")
           ] ++ flexStyle flex

mainLeftStyle : Attribute
mainLeftStyle =
  style <| [ ("position", "relative")
           , ("flex", "1 0 50%")
           ] ++ flexStyle flexCenter

mainRightStyle : Attribute
mainRightStyle =
  style <| [ ("position", "relative")
           , ("flex", "1 0 50%")
           ] ++ flexStyle flexCenter



noticeStyle : Attribute
noticeStyle =
  style [ ("font-size", "1.5rem")
        , ("font-family", "Ubuntu")
        , ("font-weight", "100")
        , ("line-height", "1")
        , ("color", "rgba(0, 0, 0, 0.80)")
        ]


clearGrey : Color
clearGrey =
  rgba 111 111 111 0.24
