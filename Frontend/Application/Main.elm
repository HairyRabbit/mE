module Main (..) where

import Html    exposing (..)
import Effects exposing (Effects, Never)
import Task
import StartApp

import Routing
import Blog

import Debug


-- ACTION

type Action
  = NoOp
  | RoutingAction Routing.Action
  | BlogAction Blog.Action


-- MODEL

type alias Model =
  { routing : Routing.Model
  , blog : Blog.Model

  }

initModel : Model
initModel =
  { routing = Routing.initModel
  , blog = Blog.initModel
  }


-- UPDATE

update : Action -> Model -> (Model, Effects Action)
update action model =
  case action of
    RoutingAction act ->
      let
        (m, fx) = Routing.update act model.routing
      in
        ( { model | routing = m}
        , Effects.map RoutingAction fx
        )

    _ ->
      (model, Effects.none)


-- VIEW

view : Signal.Address Action -> Model -> Html
view address model =
  let
    _ =
      Debug.log "model" model

    view =
      case model.routing.route of
        Routing.BlogRoute id ->
          Blog.view (Signal.forwardTo address BlogAction) model.blog id
        _ ->
          div [] [ text "notFound" ]
  in
    div
      []
      [ view ]


-- INPUT

routerSignal : Signal Action
routerSignal =
  Signal.map RoutingAction Routing.signal

-- BOOTSTRAP

init : (Model, Effects Action)
init =
  (initModel, Effects.none)

app : StartApp.App Model
app =
  StartApp.start
    { init   = init
    , inputs = [ routerSignal ]
    , update = update
    , view   = view
    }
  
main : Signal.Signal Html
main =
  app.html

port runner : Signal (Task.Task Never ())
port runner =
  app.tasks

port routeRunTask : Task.Task () ()
port routeRunTask =
  Routing.run     
