module Router.Action where

import Router.Routes exposing (Sitemap(..))

type Action
  = NoOp
  | PathChange String
  | UpdatePath Sitemap
