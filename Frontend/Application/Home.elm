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
import Application.View.Home.Nav exposing (navView)
import Application.View.Rect exposing (rectGroupView1)


type alias Model = Int

type alias TopNote =
  { title : String
  , date : String
  , intro : String
  , intro2 : String
  }

topNoteView : TopNote -> List Html
topNoteView note =
    [ h1 [] [ text <| .title note ]
    , p [ class "date" ]  [ text <| .date note ]
    , p [] [ text <| .intro note ]
    , p [] [ text <| .intro2 note ]
    ]

note : TopNote
note =
       { title = "爱上 Processing"
       , date = "Mar 20th, 2016"
       , intro = "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。"
       , intro2 = "那么首先，什么是Processing？"
       }

init : (Model, Effects Int)
init = (0, Effects.none)

update : Int -> Model -> (Model, Effects Int)
update action model = (model, Effects.none)

{-
[ h1 [ ] [ text "爱上 Processing" ]
, p [ class "date" ] [ text "Mar 20th, 2016" ]
, p [ ] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
, p [ ] [ text "那么首先，什么是Processing？" ]
]
-}                      

-- view : Signal.Address Int -> Model -> Html
-- view address model =
view : Html
view =
  main' [ mainStyle ]
          [ section [ mainLeftStyle ]
              [ section [ newsStyle
                        , class "md"
                        ] <| topNoteView note
              , rectGroupView1 "70%" "80%" 0
              , rectGroupView1 "10%" "0%" 45
              -- , section [ keywordStyle ] [ img [ src "Image/Lang/processing.svg" ] [] ]
              ]
          , section [ mainRightStyle ]
              [ headerView
              , navView
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

newsStyle : Attribute
newsStyle =
  style [ ("width", "80%")
        , ("height", "40%")
        ]
