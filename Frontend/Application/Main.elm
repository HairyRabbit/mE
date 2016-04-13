module Main (..) where

import Html    exposing (..)
import Effects exposing (Effects, Never)
import Task
import StartApp

{-
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
        (m, fx, fx2) = Routing.update act model.routing
      in
        ( { model | routing = m }
        , [ Effects.map RoutingAction fx
          , Effects.map BlogAction fx2
          ] |> Effects.batch
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
  let
    (mBlog, fxBlog) = Blog.init "1"
    effects = Effects.batch
              [ Effects.map BlogAction fxBlog
              ]
  in
    (initModel, Effects.none)

-}

import App.Init     exposing (init)
import App.Input    exposing (inputs)
import App.Update   exposing (update)
import App.View     exposing (view)
import App.Model    exposing (Model)
import Routing.Port as Routing

app : StartApp.App Model
app =
  StartApp.start
    { init   = init
    , inputs = inputs
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
