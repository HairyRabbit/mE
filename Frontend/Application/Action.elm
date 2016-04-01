module Action where

import Hotspot.Action as Hotspot

type Action
  = NoOp
  | ActionHotspot Hotspot.Action
