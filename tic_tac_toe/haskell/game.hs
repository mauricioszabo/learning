module Game where
import Board
import Text.Regex (matchRegex, mkRegex)
import Data.Char (ord)

main = gameTurn Board.empty X

gameTurn board player = do
  printBoard board
  step <- nextStep
  case step of
    (Draw, _, _) -> putStrLn "\nGame ended in a draw"
    (XWon, _, _) -> putStrLn "\nX won!"
    (OWon, _, _) -> putStrLn "\nO won!"
    (_, Nothing, _) -> wrongMove
    (_, _, Nothing) -> alreadyMarked
    (_, _, Just newBoard) -> gameTurn newBoard otherPlayer

  where
    nextStep =
      case gameStatus board of
        GameIsOn -> do
                      putStr $ "\nPlayer " ++ (show player) ++ ", your move? "
                      fmap treatInput getLine
        other -> return (other, Nothing, Nothing)

    treatInput move =
      let movement = treatMovement move
          newBoard = updatedBoard movement
      in (GameIsOn, movement, newBoard)

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
  let regex = (mkRegex "^([ABC])([123])$")
      match = matchRegex regex move
      in fmap makePair match
  where
    makePair [col, row] = (treatRow row, treatCol col)
    treatCol row = (ord $ row !! 0) - (ord 'A')
    treatRow :: String -> Int
    treatRow col = (read col) - 1
