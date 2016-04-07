module Post.Model where

type alias Post =
  { id    : String
  , title : String
  , date  : String
  , intro : String
  , isHot : Boolean
  , path  : String
  }

type alias Model = List Post

initModel : List Model
initModel = []
