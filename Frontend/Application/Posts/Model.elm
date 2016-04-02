module Posts.Model where

type Post =
  { id : String
  , datetime : String
  , title : String
  }

type alias Model = List Post
