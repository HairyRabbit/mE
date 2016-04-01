module Application.Router where

{-| 逗逼担当，负责路由path到指定模块

/          -> Home
/posts     -> Post list
/posts/:id -> Post detail
/about     -> About me
/*         -> 404 Not Found

-}

import Html exposing (..)
import Html.Attributes exposing (href)
import Html.Events exposing (onClick)

import History
import Effects exposing (Effects, none)
import Task exposing (..)
import Route exposing (..)
import Application.Home
import Application.View.Posts.Posts as Posts
import Application.Hotspot as Hotspot
import Application.Page exposing (..)
import Application.Sitemap exposing (..)

homeR  = HomeR := static ""
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
  | GetHotspot Hotspot.Action

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

    GetHotspot act ->
      let
        (m, fx) = Hotspot.update act { date = "", intro = "", title = "" }
      in
        ( model
        , none
        )
      

init : String -> (Model, Effects Action)
init path =
  ( { page = pathToPage path }
  , Effects.none
  )


type alias Linker = Sitemap -> String -> Html

notFound : Html
notFound = text "Page not found"


home : Html
home = text "Home page"

posts : Html
posts = text "施工中..."

about : Html
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
              About -> Hotspot.view (Signal.forwardTo address GetHotspot) { date = "", title = "aaa", intro = "" }
              Posts -> Posts.view (Signal.mailbox Posts.None).address 0
              NotFound -> notFound
           ]
