module Application.Style.Flex ( flex
                              , flexStart
                              , flexCenter
                              , flexColumn
                              , flexStyle
                              ) where

import Application.Style exposing (..)

type Direction = Row
               | RowReverse
               | Column
               | ColumnReverse

type Wrap      = Wrap
               | NoWrap
               | WrapReverse

type Position  = Start
               | End
               | Center
               | Between
               | Around
               | Baseline
               | Stretch

type alias Flex =
  { justify: Style
  , align : Style
  , flow : Style
  }


directionProp : Direction -> String
directionProp direction =
  case direction of
    RowReverse ->
      "row-reverse"
    Column ->
      "column"
    ColumnReverse ->
      "column-reverse"
    _ ->
      "row"

wrapProp : Wrap -> String
wrapProp wrap =
  case wrap of
    Wrap ->
      "wrap"
    WrapReverse ->
      "wrap-reverse"
    _ ->
      "nowrap"

justifyContentProp : Position -> String
justifyContentProp position =
  case position of
    End ->
      "flex-end"
    Center ->
      "center"
    Between ->
      "space-between"
    Around ->
      "space-around"
    _ ->
      "flex-start"

alignItemsProp : Position -> String
alignItemsProp position =
  case position of
    Start ->
      "flex-start"
    End ->
      "flex-end"
    Center ->
      "center"
    Baseline ->
      "baseline"
    _ ->
      "stretch"

directionStyle : Direction -> Style
directionStyle direction =
  ("flex-direction", directionProp direction)

wrapStyle : Wrap -> Style
wrapStyle wrap =
  ("flex-wrap", wrapProp wrap)

flowStyle : Direction -> Wrap -> Style
flowStyle direction wrap =
  ("flex-flow", directionProp direction ++ " " ++ wrapProp wrap)

justifyContentStyle : Position -> Style
justifyContentStyle position =
  ("justify-content", justifyContentProp position)

alignItemsStyle : Position -> Style
alignItemsStyle position =
  ("align-items", alignItemsProp position)

flex : Flex
flex =
  { justify = justifyContentStyle Start
  , align   = alignItemsStyle Stretch
  , flow    = flowStyle Row NoWrap
  }

flexStart : Flex
flexStart =
  { justify = justifyContentStyle Center
  , align   = alignItemsStyle Start
  , flow    = flowStyle Row NoWrap
  }

flexCenter : Flex
flexCenter =
  { justify = justifyContentStyle Center
  , align   = alignItemsStyle Center
  , flow    = flowStyle Row NoWrap
  }

flexColumn : Flex
flexColumn =
  { justify = justifyContentStyle Center
  , align   = alignItemsStyle Start
  , flow    = flowStyle Column NoWrap
  }

flexStyle : Flex -> List Style
flexStyle flex =
  [ ("display", "flex")
  , .justify flex
  , .align flex
  , .flow flex
  ]
