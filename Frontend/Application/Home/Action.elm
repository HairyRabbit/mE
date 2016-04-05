module Home.Action where

-- import Hotspot.Action as Hotspot

-- type Action
--   = NoOp
--   | ActionHotspot Hotspot.Action

import Post as Post

type Action
  = NoOp
  | ActionPost Post.Action
