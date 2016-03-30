module Application.View.Posts.Posts (view, Action(..), Model) where

import Html exposing (..)
import Html.Attributes exposing (..)
import Application.Style.Flex exposing (..)
import Application.Style.Color exposing (fcG2, fcG3, fcG4)
import Application.Sitemap exposing (..)
import Application.View.Posts.Header as Header
-- import Application.View.Home.Nav as Nav
import Application.View.Posts.Hello as Hello
import Application.View.Rect exposing (rectGroupView1)

type Action = None

type alias Model = Int

view : Signal.Address Action -> Model -> Html
view address model =
  main'
    [ mainLayout ]
    [ section
        [ leftLayout ]
        [  section
             [ listStyle
             , class "md"
             ]
             [ --div [ listBgStyle ] []
                 ul
                 [ class "listReset" ]
                 [ li
                     [ postThirdLevelStyle ]
                     [  span [ postDateStyle ] [ text "Jul 10th" ]
                     , span [ postTitleStyle ] [ text "来玩玩 Angular2" ]
                     ]
                 , li
                     [ postSecondLevelStyle ]
                     [  span [ postDateStyle ] [ text "Jul 22nd" ]
                     , span [ postTitleStyle ] [ text "Julia 静态类型脚本语言？" ]
                     ]
                 , li
                     [ postTopLevelStyle ]
                     [  span [ postDateStyle ] [ text "Oct 1st" ]
                     , span [ postTitleStyle ] [ text "ember-cli 脚手架" ]
                     , p [ postIntroStyle ] [ text "ember-cli是用来构建emberjs项目的工具，他是基于之前的一个项目EAK (ember app kit)开发而成。那么问题来了，ember-cli 具体能做些什么事呢？这片文章内所用到的IDE是Sublime Text 3，操作系统为Windows 8.1，浏览器使用的是Mozilla Firefox 33.0.2，并且假设你对emberjs的基础有一定的了解。" ]
                     ]
                 , li
                     [ postSecondLevelStyle ]
                     [  span [ postDateStyle ] [ text "Sep 3rd" ]
                     , span [ postTitleStyle ] [ text "elm 架构真的好难" ]
                     ]
                 , li
                     [ postThirdLevelStyle ]
                     [  span [ postDateStyle ] [ text "Nov 1st" ]
                     , span [ postTitleStyle ] [ text "去喝茶" ]
                     ]
                 ]
             ]
        , rectGroupView1 "48%" "-10%" 0
        , rectGroupView1 "28%" "110%" 135
        ]
    , section
        [ rightLayout ]
        [ Header.view
        -- , Nav.view link1 link2
        , Hello.view
        ]
    ]

mainLayout : Attribute
mainLayout =
  style <| [ ("width", "64rem")
           , ("height", "100%")
           , ("position", "relative")
           ] ++ flexStyle flex

leftLayout : Attribute
leftLayout =
  style <| [ ("position", "relative")
           , ("flex", "1 0 50%")
           ] ++ flexStyle flexCenter

rightLayout : Attribute
rightLayout =
  style <| [ ("position", "relative")
           , ("flex", "1 0 50%")
           ] ++ flexStyle flexCenter

middleLayout : Attribute
middleLayout =
  style [ ("padding", "22rem 24% 0") ]

listStyle : Attribute
listStyle =
  style [ ("position", "relative") ]
        
listBgStyle : Attribute
listBgStyle =
  style [ ("position", "absolute")
        , ("top", "0")
        , ("right", "0")
        , ("bottom", "0")
        , ("left", "0")
        ]

postDateStyle : Attribute
postDateStyle =
  style [ ("width", "5rem")
        , ("display", "inline-block")
        , ("text-align", "right")
        , ("padding", "0 1rem 0 0")
        ]

postTitleStyle : Attribute
postTitleStyle =
  style [ ("font-size", "1.2rem")
        , ("cursor", "pointer")
        -- , fcG4
        ]

postIntroStyle : Attribute
postIntroStyle =
  style [ ("padding", "1rem 0 1rem 6rem") ]


postTopLevelStyle : Attribute
postTopLevelStyle =
  style [ ("margin", "2rem 0") ]
        
postSecondLevelStyle : Attribute
postSecondLevelStyle =
  style [ ("margin", "2rem 0")
        -- , ("transform", "translate3D(-1rem, 0, 0)")
            , fcG3
        ]

postThirdLevelStyle : Attribute
postThirdLevelStyle =
  style [ ("margin", "2rem 0")
        -- , ("transform", "translate3D(-2rem, 0, 0)")
        , ("opacity", "1")
        , ("transition", "opacity 1s ease 1s")
        , fcG2
        ]
