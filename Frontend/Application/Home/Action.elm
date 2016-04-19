module Home.Action where

import Home.Model exposing (Model)



type Action
  = NoOp
  | OnFetched (Maybe Model)
