module Game where
import Board
import Text.Regex (matchRegex, mkRegex)
import Data.Char (ord)

main = gameTurn Board.empty X

gameTurn board player = do
  printBoard board
  putStr $ "\nPlayer " ++ (show player) ++ ", your move? "
  move <- getLine
  case movementAndBoard move of
    (Nothing, _) -> wrongMove
    (_, Nothing) -> alreadyMarked
    (_, Just newBoard) -> gameTurn newBoard otherPlayer

  where
    movementAndBoard move =
      let movement = treatMovement move
          newBoard = updatedBoard movement
      in (movement, newBoard)

    updatedBoard (Just move) = update board move player
    otherPlayer = if player == X then O else X
    wrongMove = do
      putStrLn "Wrong move: must be A1, A2, B2, etc.\n"
      gameTurn board player
    alreadyMarked = do
      putStrLn "Position already is marked!\n"
      gameTurn board player

treatMovement :: String -> Maybe (Int, Int)
treatMovement move =
  let regex = (mkRegex "([ABC])([123])")
      match = matchRegex regex move
      in fmap makePair match
  where
    makePair [row, col] = (treatRow row, treatCol col)
    treatRow row = (ord $ row !! 0) - (ord 'A')
    treatCol :: String -> Int
    treatCol col = (read col) - 1
