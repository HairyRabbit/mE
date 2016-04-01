module Action where

import Router.Action as Router

type Action
  = NoOp
  | ActionRouter Router.Action
