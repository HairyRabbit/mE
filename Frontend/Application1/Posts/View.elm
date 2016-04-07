module Posts.View where

import Html            exposing (..)
import Html.Attributes exposing (..)

import Header.View as Header
import Posts.Action exposing (Action(..))
import Posts.Model exposing (Model)
import Debug exposing (log)

view : Signal.Address Action -> Model -> Html -> Html
view address model nav =
  main'
    [ mainLayout ]
    [ section
        [ leftLayout ]
        [ Header.view "Blog" ]
    , section
        [ middleLayout, class "md" ]
        [ ul
            [ class "listReset" ]
            <| List.map (\x -> span [] [ text <| toString x ] ) (log "" model)
        ]
    , section
        [ rightLayout ]
        [ section
            [ imgStyle ]
            [ img
                [ src "./Image/Cat.jpg"
                ] []
            ]
        , section [ navStyle ] [ nav ]
        ]
    ]

    -- [ li
    --     [ listStyle]
    --     [ span [ class "mm" ] [ text "Jul " ]
    --     , span [ class "dd" ] [ text "2nd " ]
    --     , span [ class "title" ] [ text "Julia linux下的安装" ]
    --     ]
    -- ]
mainLayout : Attribute
mainLayout =
  style [ ("width", "70rem")
        , ("height", "40rem")
        , ("position", "relative")
        , ("display", "flex")
        ]

leftLayout : Attribute
leftLayout =
  style [ ("display", "flex")
        , ("justifyContent", "center")
        , ("alignItems", "center")
        , ("flex", "0 1 30%")
        ]

rightLayout : Attribute
rightLayout =
  style [ ("display", "flex")
        , ("justifyContent", "center")
        , ("alignItems", "center")
        , ("flexFlow", "column nowrap")
        , ("position", "relative")
        , ("flex", "0 1 30%")
        ]

middleLayout : Attribute
middleLayout =
  style [ ("flex", "1 1 auto")
        , ("boxSizing", "border-box")
        , ("padding", "6rem 2rem")
        ]


navStyle : Attribute
navStyle =
  style [ ("position", "absolute")
        , ("top", "30%")
        , ("left", "10%")
        ]

imgStyle : Attribute
imgStyle =
  style [ ("margin", "15rem 0 0 0")
        ]

listStyle : Attribute
listStyle =
  style [ ("margin", "2rem 0")
        ]
