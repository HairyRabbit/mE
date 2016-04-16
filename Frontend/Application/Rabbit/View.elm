module Rabbit.View where

{-| 一个兔子

@Todo
使用 Elm 重写动画效果。

-}

import Html           exposing (Html)
import Svg            exposing (..)
import Svg.Attributes exposing (..)
import Util.Class     exposing ((|-|))

-- View

view : Html
view =
  svg
    [ width   "72"
    , height  "80"
    , viewBox "0 0 72 80"
    , class "rabbit"
    ]
    [ bodyView
    , eyesView "21" 1
    , eyesView "51" 2
    , earsView "26" 1
    , earsView "46" 2
    ]
    
    
-- 馒头

bodyView : Svg
bodyView =
  Svg.path
    [ class "rabbit-body"
    , d "m 17.348205,42.380918 c -21.5350548,8.723241 -24.6415848,36.705143 -0.08984,37.523246 9.33221,0.127781 27.816951,0.127781 37.061644,0 28.522989,-1.165829 18.049454,-31.164061 -0.0023,-37.523246 -9.308054,-3.150364 -27.069767,-3.198659 -36.969486,0 z"
    ] []


-- 眼睛

eyesView : String -> Int -> Svg
eyesView x idx =
  circle
    [ class <| "rabbit-eye" |-| "rabbit-eye-" ++ toString idx
    , r  "2"
    , cy "70"
    , cx x
    ] []


-- 耳朵
earsView : String -> Int -> Svg
earsView x idx =
  g
    [ class <| "rabbit-ear" |-| "rabbit-ear-" ++ toString idx ]
    [ ellipse
        [ class "rabbit-ear-lg"
        , rx "5"
        , ry "20"
        , cx x
        , cy "20"
        ] []
    , ellipse
        [ class "rabbit-ear-sm"
        , rx "2"
        , ry "10"
        , cx x
        , cy "28"
        ] []
    ]
    
