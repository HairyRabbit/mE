module Application.Style.Color ( grey1
                               , grey2
                               , grey3
                               , grey4
                               ) where

makeColor : Float -> String
makeColor alpha =
  "rgba(0, 0, 0, " ++ toString alpha ++ ")"

grey1 : String
grey1 = makeColor 0.16

grey2 : String
grey2 = makeColor 0.32

grey3 : String
grey3 = makeColor 0.56

grey4 : String
grey4 = makeColor 0.72
