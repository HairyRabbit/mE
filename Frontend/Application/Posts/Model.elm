module Posts.Model where

type Newsletter =
  { id : String
  , datetime : String
  , title : String
  }

type alias Model = List Newsletter

