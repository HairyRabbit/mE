{- mode: Elm -}
{- coding: utf-8 -}
module Icon.View where

{-| View

图标，用于显示在：

* 文章所属分类，关键词
* vip 技术栈

@todo
将所有svg打包成精灵

-}

import Html            exposing (..)
import Html.Attributes exposing (..)
import Util.Class      exposing (class2)
import Util.Image      exposing (image)
import Icon.Model      exposing (Icon, Lang)
import String



view : (List Icon) -> Html
view icons =
  section [ class "langs" ] <| List.map iconView icons


langsView : List Lang -> List String -> Html
langsView langs' langs =
  langs'
    |> List.filter (\x -> List.member x.name langs)
    |> List.map langView
    |> section [ class "langs" ]


iconView : Icon -> Html
iconView icon =
  let
    prefix =
      "./Image/Icon/"
        
    path =
      prefix ++ icon.path ++ ".svg"
  in
    a [ class "lang"
      , href icon.href
      ]
      [ image path
      , div [ class2 "none-select" "lang-tip" ]
          [ text icon.name ]
      ]


langPath : String
langPath =
  "./Image/Icon/"


langView : Lang -> Html
langView lang =
  let
    addPostfix =
      (++) langPath

    addSuffix a =
      (++) a ".svg"

    path =
      lang
        |> .name
        |> String.toLower
        |> addPostfix >> addSuffix
  in
    a [ class "lang"
      , href lang.href
      ]
      [ image path
      , div [ class2 "none-select" "lang-tip" ]
          [ text lang.name ]
      ]
  
