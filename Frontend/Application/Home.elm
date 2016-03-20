module Application.Home (init, update, view) where

import Graphics.Element exposing (..)
import Graphics.Collage exposing (collage, rect, filled, move)
import Color exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Markdown exposing (..)
import Effects exposing (Effects, Never)
import Task

import Application.Style.Flex exposing (..)
import Application.Style.Color exposing (grey2, grey3, grey4)
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
              [ section [ newsStyle ]
                  [ h1 [ noticeStyle ]
                      [ text "爱上 Processing" ]
                  , p [ dateStyle ] [ text "Mar 20th. 2016" ]
                  , p [ introStyle ] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
                  , p [ introStyle ] [ text "那么首先，什么是Processing？" ]
                  , p [ introStyle ] [ text "..." ]
                  ]
              , rectGroupView1 "70%" "70%" 0
              , rectGroupView1 "10%" "0%" 45
              ]
          , section [ mainRightStyle ]
              [ headerView
              -- , navView
              , helloView
              ]
          ]


mainStyle : Attribute
mainStyle =
  style <| [ ("width", "64rem")
           , ("height", "40rem")
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
        , ("color", grey4)
        , ("margin", "0 0 1rem 0")
        ]

dateStyle : Attribute
dateStyle =
  style [ ("color", grey2)
        , ("font-size", "0.8rem")
        , ("margin", "-0.5rem 0 2rem 0")
        ]

introStyle : Attribute
introStyle =
  style [ ("color", grey3)
        , ("margin", "0 0 1rem 0")
        ]

newsStyle : Attribute
newsStyle =
  style [ ("width", "80%")
        , ("height", "40%")
        ]
