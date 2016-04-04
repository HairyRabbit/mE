module Posts.Model where

type alias Post =
  { id : String
  , datetime : String
  , title : String
  }

type alias Model = List Post
