module Util.DateFmter where

import Date


dateFmter : String -> String
dateFmter date =
  case (Date.fromString date) of
    Ok d ->
      let
        mm =
          d |> Date.month |> toString
        dd =
          d |> Date.day |> dayth
        yy =
          d |> Date.year |> toString
      in
        mm ++ ", " ++ dd ++ " " ++ yy
    Err e ->
      toString e

dateFmter2 : String -> String
dateFmter2 date =
  case (Date.fromString date) of
    Ok d ->
      let
        mm =
          d |> Date.month |> toString
        dd =
          d |> Date.day |> dayth
      in
        mm ++ ", " ++ dd
    Err e ->
      toString e               

dayth : Int -> String
dayth dd =
  case (rem dd 10) of
    1 ->
      toString dd ++ "st"
    2 ->
      toString dd ++ "nd"
    3 ->
      toString dd ++ "rd"
    _ ->
      toString dd ++ "th"
      
