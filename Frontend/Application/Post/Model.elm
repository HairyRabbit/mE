module Post.Model (Post, initPost) where

{-| Model

文章类型

@todos
增加关键字字段 keywords

@todos
增加所属分组 groupId

@todos
增加评论列表 comments

-}



type alias Post =
  { id    : String
  , title : String
  , date  : String
  , intro : String
  }

initPost : Post
initPost =
  { id    = ""
  , title = ""
  , date  = ""
  , intro = ""
  }
