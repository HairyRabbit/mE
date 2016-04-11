module Blog.Model where


type alias PostID = String

type alias Model =
  { id      : PostID
  , content : String
  }

initModel : Model
initModel =
  { id      = ""
  , content = ""
  }
