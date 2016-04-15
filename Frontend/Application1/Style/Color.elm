module Application.Style.Color ( grey1
                               , grey2
                               , grey3
                               , grey4
                               , fcG1, fcG2, fcG3, fcG4
                               , fcPc
                               ) where

import Application.Style exposing (..)

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

fc : String -> Style
fc rgba =
  ("color", rgba)

bgc : String -> Style
bgc rgba =
  ("background-color", rgba)

fcG1 : Style
fcG1 = fc grey1

fcG2 : Style
fcG2 = fc grey2

fcG3 : Style
fcG3 = fc grey3

fcG4 : Style
fcG4 = fc grey4

fcPc : Style
fcPc = fc "red"
