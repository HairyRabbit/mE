module Post (..) where

type alias PostId =
  String

type alias Post =
  { id    : PostId
  , title : String
  }          

initPost : Post
initPost =
  { id = ""
  , title = ""
  }
