module NotFound.View (view) where

{-| View

404页面

@todos
增加 history.back()

-}

import Html            exposing (..)
import Html.Attributes exposing (..)
import Rabbit.View     as Rabbit



view : Html
view =
  main' [ class "notfound-main" ]
    [ section [ class "notfound-txt" ]
        [ text "木有找到呢 ◕‿↼" ]
    , section []
        [ Rabbit.view ]
    ]
