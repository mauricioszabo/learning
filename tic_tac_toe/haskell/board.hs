module Board where
import Data.Vector (Vector, (!), (//))
import qualified Data.Vector as Vector
import qualified Data.Maybe as Maybe
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

get :: Board -> (Int, Int) -> Mark
get board (row, col) = board ! row ! col

update :: Board -> (Int, Int) -> Mark -> Board
update board (row, col) mark =
  let inner = board ! row // [(col, mark)]
    in board // [(row, inner)]

-- whoWon :: Board -> Maybe Mark
whoWon board =
  let trans =  transpose $ vectorAsList board
      res = [find playerWon board,
             find playerWon trans]
  in Maybe.listToMaybe $ Maybe.catMaybes res
  -- where
-- playerWon :: (Foldable Mark) -> Bool
playerWon row = (all (== X) row) || (all (== O) row)


printBoard board = do
  putStrLn "     A   B   C"
  putStrLn $ "  1  " ++ (intercalate " | " $ nthRow 0)
  putStrLn "    ---+---+---"
  putStrLn $ "  2  " ++ (intercalate " | " $ nthRow 1)
  putStrLn "    ---+---+---"
  putStrLn $ "  3  " ++ (intercalate " | " $ nthRow 2)
  where
    nthRow n = map toString $ Vector.toList (board ! n)
    toString Empty = " "
    toString player = show player

vectorAsList board = Vector.toList $ Vector.map Vector.toList board
