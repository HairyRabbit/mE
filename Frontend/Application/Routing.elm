module Routing (..) where

import Task         exposing (Task)
import Effects      exposing (Effects, Never)
import Hop
import Hop.Types    exposing (Location, PathMatcher, Router, newLocation)
import Hop.Navigate exposing (navigateTo)
import Hop.Matchers exposing (match1, match2, match3, str)

import Post


-- ACTION

type Route
  = NotFoundRoute
  | BlogRoute Post.PostId


type Action
  = HopAction  ()
  | ApplyRoute (Route, Location)
  | NavigateTo String


-- MODEL

type alias Model =
  { location : Location
  , route    : Route
  }

initModel : Model
initModel =
  { location = newLocation
  , route = BlogRoute "1"
  }


-- UPDATE
update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    NavigateTo path ->
      let
        effects =
          Effects.map HopAction <| navigateTo path
      in
      (model, effects)

    ApplyRoute (route, location) ->
      let
        model' =
          { model |
              route    = route,
              location = location
          }
      in
        (model', Effects.none)

    HopAction () ->
      (model, Effects.none)


-- indexMatcher : PathMatcher Route
-- indexMatcher =
--   match1

blogMatcher : PathMatcher Route
blogMatcher =
  match2 BlogRoute "/blog/" str

matchers : List (PathMatcher Route)
matchers =
  [ blogMatcher
  ]

router : Router Route
router =
  Hop.new
    { matchers = matchers
    , notFound = NotFoundRoute
    }

run : Task () ()
run =
  router.run

signal : Signal Action
signal =
  Signal.map ApplyRoute router.signal
