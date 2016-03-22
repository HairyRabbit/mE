module Application.Posts (view) where

import Html exposing (..)
import Html.Attributes exposing (..)

import Application.Style.Flex exposing (..)
import Application.Sitemap exposing (..)
import Application.View.Posts.Header as Header


view : Html
view =
  main'
    [ mainLayout ]
    [ section
        [ leftLayout ]
        [ Header.view ]
    , section
        [ middleLayout ]
        [ section
            [ class "md" ]
            [ h1 [] [ text "介绍 ember-cli 工具" ]
            , p [ class "date" ] [ text "Mar 20th, 2016" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            , p [] [ text "Processing？ 喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。喜欢好久了但一直没时间入，今天终于有时间看了一个通宵。还是挺喜欢的，拿他攻打GUI这个BOSS我想应该木问题。" ]
            ]
        ]
    , section
        [ rightLayout ]
        []
    ]


mainLayout : Attribute
mainLayout =
  style [ ("width", "82rem")
        , ("height", "100%")
        , ("position", "relative")
        ]

leftLayout : Attribute
leftLayout =
  style [ ("position", "absolute")
        , ("top", "0")
        , ("bottom", "0")
        , ("left", "0")
        , ("width", "20%")
        ]

rightLayout : Attribute
rightLayout =
  style [ ("position", "absolute")
        , ("top", "0")
        , ("bottom", "0")
        , ("right", "0")
        , ("width", "20%")
        ]

middleLayout : Attribute
middleLayout =
  style [ ("padding", "22rem 24% 0") ]


