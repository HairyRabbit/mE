module Home.Action where

import Hotspot.Action

type Action
  = ActionHotspot Hotspot.Action.Action
