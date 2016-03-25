module Application.Posts.Post where

{-| BLOG. 

 -}

import Date exposing (..)

-- MODEL

type alias Post =
  { date  : Date
  , title : String
  , intro : String  
  }

type alias Model =
  { posts : List Post
  , url   : String 
  }                 

init : Post -> (Model, Effects Action)
init post =
  ( 
  )


-- UPDATE

type Action
  = RequestMore
  | NewPost (Maybe String)

    
update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RequestMore ->
      (model, getPost model.post)
            
  
-- view

view : Signal.Address Action -> Model -> Html
view address model =
  section
    []
    [ div
        []
        [ span [] [ text "Jul" ]
        , span [] []
        ]
    ]


dateView : String -> Strin -> Html
dateView mm dd =
  div
    []
    [ span [] [ text mm ]
    , span [] [ text dd ]
    ]
