module Action where

import Router.Action as Router
import Home.Action   as Home

type Action
  = NoOp
  | ActionRouter Router.Action
  | ActionHome   Home.Action
