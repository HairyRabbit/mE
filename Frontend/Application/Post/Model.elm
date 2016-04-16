module Post.Model where

{-| Post

文章类型

-}
type alias Post =
  { id      : String
  , title   : String
  , date    : String
  , intro   : String
  }

initPost : Post
initPost =
  { id      = ""
  , title   = ""
  , date    = ""
  , intro   = ""
  }
