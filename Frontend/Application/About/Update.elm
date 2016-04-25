{- mode: Elm -}
{- coding: utf-8 -}
module About.Update where

update : Action -> Model -> Model
update action model =
  case action of
    NoOp ->
      model
