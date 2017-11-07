module Board where
import Data.Vector (Vector, (!), (//))
import qualified Data.Vector as Vector
import Data.List as List
type Board = Vector (Vector Mark)

data Mark = Empty | X | O deriving (Eq, Show)

empty = Vector.replicate 3 $ Vector.replicate 3 Empty

showBoard board =
  let rowsAsList = Vector.map Vector.toList board
      boardAsList = Vector.toList rowsAsList
      rows = map showRow $ zip [1,2..] boardAsList
      in "     A   B   C\n" ++ intercalate "\n    ---+---+---\n" rows
  where
    showRow (idx, row) = "  " ++ (show idx) ++ "  " ++ (intercalate " | " $ map toString row)
    toString Empty = " "
    toString player = show player

update :: Board -> (Int, Int) -> Mark -> Board
update board (row, col) mark =
  let inner = board ! row // [(col, mark)]
    in board // [(row, inner)]
