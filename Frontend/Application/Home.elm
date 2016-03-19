module Application.Home (init, update, view) where

import Graphics.Element exposing (..)
import Graphics.Collage exposing (collage, rect, filled, move)
import Color exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Effects exposing (Effects, Never)
import Task
import Application.Style.Flex exposing (..)
import Application.View.Home.Nav exposing (navView)

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
              , fromElement <| collage 100 100
                  [ rect 30 40 |> filled clearGrey
                  , rect 30 40 |> filled clearGrey |> move(18, -25)
                  ]
              ]
          , section [ mainRightStyle ]
              [ header [ headerStyle ]
                  [ section [ headerLeftStyle ]
                      [ div [ logoStyle ] [ text "HJ" ] ]
                  , section [ headerRightStyle ]
                      [ div [ welcomeStyle ] [ text "Welcome" ]
                      , div [ introStyle ] [ text "Happy Hack with my life" ]
                      ]                 
                  ]
              , navView
              , section []
                  [ img [ style [("width", "60%")]
                        , src "./Image/Just-me.jpg" ] [] ]
              ]
          ]

mainStyle : Attribute
mainStyle =
  style <| [ ("max-width", "1000px")
           , ("margin", "0 auto")
           , ("position", "fixed")
           , ("top", "0")
           , ("right", "0")
           , ("bottom", "0")
           , ("left", "0")
           , ("padding", "5% 0")
           ] ++ flexStyle flex

mainLeftStyle : Attribute
mainLeftStyle =
  style <| [ ("position", "relative")
           , ("flex", "1 1 auto")
           ] ++ flexStyle flexCenter

mainRightStyle : Attribute
mainRightStyle =
  style <| [ ("position", "relative")
           , ("flex", "1 1 auto")
           ] ++ flexStyle flexCenter


logoStyle : Attribute
logoStyle =
  style [ ("font-size", "4rem")
        , ("font-family", "Ubuntu")
        , ("font-weight", "100")
        , ("line-height", "1")
        , ("margin", "0 1rem 0 0")
        ]

welcomeStyle : Attribute
welcomeStyle =
  style [ ("font-size", "1.25rem")
        , ("font-family", "Ubuntu")
        , ("font-weight", "100")
        , ("line-height", "1")
        , ("color", "rgba(0, 0, 0, 0.72)")
        , ("margin", "0 0 0.5rem 0")
        ]

introStyle : Attribute
introStyle =
  style [ ("font-size", "0.85rem")
        , ("font-family", "Ubuntu")
        , ("font-weight", "100")
        , ("line-height", "1")
        , ("color", "rgba(0, 0, 0, 0.56)")
        ]

headerStyle : Attribute
headerStyle =
  style <| flexStyle flex

headerLeftStyle : Attribute
headerLeftStyle =
  style <| flexStyle flexCenter

headerRightStyle : Attribute
headerRightStyle =
  style <| flexStyle flexColumn

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
