module Hotspot.Model where

type alias Model =
  { title : String
  , date  : String
  , intro : String
  }

initModel : Model
initModel =
  { title = ""
  , date = ""
  , intro = ""
  }
