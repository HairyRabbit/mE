module Application.Hotspot where

{-| Hotspot 新写的文章，放在首页
GET /hotspot
-}

import Effects exposing (Effects, Never)
import Html exposing (..)
import Html.Attributes exposing (style)
--import Html.Events exposing (onClick)
import Http
import Json.Decode as Json
import Task


-- Model

hotspotUrl : String
hotspotUrl = "localhost:4000/hotspot"

type alias Post =
  { title : String
  , date  : String
  , intro : String
  }

type alias Model = Post

init : (Model, Effects Action)
init =
  ( { date = "", title = "", intro = "" }
  , getPost
  )



-- Update

type Action
  = Request
  | NewPost (Maybe String)

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    Request ->
      (model, getPost)
    NewPost url ->
      ( model
      , Effects.none
      )
      


-- View    
view : Signal.Address Action -> Model -> Html
view address model =
  section
    []
    [ h1 [] [ text model.title ]
    ]
    

-- Effects
getPost : Effects Action
getPost =
  Http.getString hotspotUrl
      |> Task.toMaybe
      |> Task.map NewPost
      |> Effects.task


-- Http.getString : String -> Task Error String
-- Task.toMaybe : Task x a -> Task never (Maybe a)
-- Effects.task : Task Never a -> Effects a
