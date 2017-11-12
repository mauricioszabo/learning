module Board where
import Data.List (intercalate,find,transpose)
import Data.Generics.Aliases (orElse)

type Board = [[Mark]]

data Mark = Empty | X | O deriving (Eq, Show)
data GameStatus = XWon | OWon | GameIsOn | Draw deriving (Eq, Show)

empty = replicate 3 $ replicate 3 Empty

-- showBoard board =
--   let rowsAsList = Vector.map Vector.toList board
--       boardAsList = Vector.toList rowsAsList
--       rows = map showRow $ zip [1,2..] boardAsList
--       in "     A   B   C\n" ++ intercalate "\n    ---+---+---\n" rows
--   where
--     showRow (idx, row) = "  " ++ (show idx) ++ "  " ++ (intercalate " | " $ map toString row)
--     toString Empty = " "
--     toString player = show player

-- get :: Board -> (Int, Int) -> Mark
-- get board (row, col) = board !! row !! col
--
update :: Board -> (Int, Int) -> Mark -> Maybe Board
update board (row, col) mark =
  case board !! row !! col of
    Empty -> Just $ updateOne board row inner
    _ -> Nothing
  where
    inner = updateOne (board !! row) col mark
    updateOne :: [a] -> Int -> a -> [a]
    updateOne list pos element =
      take pos list ++ [element] ++ drop (pos + 1) list

printBoard board = do
  putStrLn "     A   B   C"
  putStrLn $ "  1  " ++ (intercalate " | " $ nthRow 0)
  putStrLn "    ---+---+---"
  putStrLn $ "  2  " ++ (intercalate " | " $ nthRow 1)
  putStrLn "    ---+---+---"
  putStrLn $ "  3  " ++ (intercalate " | " $ nthRow 2)
  where
    nthRow n = map toString $ board !! n
    toString Empty = " "
    toString player = show player

gameStatus :: Board -> GameStatus
gameStatus board =
  case (whoWon, isDraw) of
                        (Just X, _) -> XWon
                        (Just O, _) -> OWon
                        (_, True) -> Draw
                        (_, False) -> GameIsOn
  where
    whoWon :: Maybe Mark
    whoWon = (findSamePlayers board) `orElse`
             (findSamePlayers $ transpose board) `orElse`
             (findSamePlayers $ diagonals)
    diagonals = [map (\(r,i) -> r !! i) $ zip board [0,1,2],
                 map (\(r,i) -> r !! i) $ zip board [2,1,0]]
    findSamePlayers board = fmap (\row -> row !! 0) $ find samePlayerInRow board
    samePlayerInRow [a, b, c] = a == b && a == c && (a == X || a == O)
    isDraw = not $ any (any (== Empty)) board
