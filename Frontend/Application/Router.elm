module Application.Router where

import Html exposing (..)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)

import History
import Effects exposing (Effects, none)
import Task exposing (..)
import Route exposing (..)
import Application.Home
import Application.View.Posts.Posts as Posts
import Application.Page exposing (..)
import Application.Sitemap exposing (..)

homeR = HomeR := static ""
aboutR = AboutR := static "about"
postsR = PostsR := static "posts"

sitemap = router [ homeR
                 , aboutR
                 , postsR
                 ]

match : String -> Maybe Sitemap
match = Route.match sitemap

route : Sitemap -> String
route route =
  case route of
    HomeR () -> reverse homeR []
    AboutR () -> reverse aboutR []
    PostsR () -> reverse postsR []

type alias Model = { page: Page }

type Action
  = NoOp
  | PathChange String
  | UpdatePath Sitemap

routeToPath : Sitemap -> Page
routeToPath route =
  case route of
    HomeR () -> Home
    AboutR () -> About
    PostsR () -> Posts

pathToPage :  String -> Page
pathToPage path =
  case match path of
    Nothing -> NotFound
    Just route -> routeToPath route

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NoOp ->
      ( model
      , none
      )

    PathChange p ->
      ( { page = pathToPage p }
      , none
      )

    UpdatePath r ->
      ( model
      , route r
      |> History.setPath
      |> Task.toMaybe
      |> Task.map (always NoOp)
      |> Effects.task
      )

init : String -> (Model, Effects Action)
init path =
  ( { page = pathToPage path }
  , none
  )


type alias Linker = Sitemap -> String -> Html

notFound : Html
notFound = text "Page not found"


home : Html
home = text "Home page"

posts : Html
posts = text "施工中..."

about :  Html
about = text "施工中..."

view : Signal.Address Action -> Model -> Html
view address model =
  let
    link route =
      a [ onClick address (UpdatePath route) ]
    postsLink  = link (PostsR ())
    aboutLink = link (AboutR ())

  in
    div [] [case model.page of
              Home -> Application.Home.view postsLink aboutLink
              About -> about
              Posts -> Posts.view
              NotFound -> notFound
           ]

  {-
  ul []
  [ li [] [ link (HomeR ()) "Home" ]
  , li [] [ link (AboutR ()) "About" ]
  ]
   -}
