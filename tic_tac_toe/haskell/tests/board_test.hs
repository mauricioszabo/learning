module BoardTest where
import Test.HUnit
import Data.Vector as Vector (toList, fromList, Vector)
import Data.List as List
import Board

boardUpdate =
  let expectedBoard = [[Empty, Empty, Empty],
                       [X,     Empty, Empty],
                       [Empty, Empty, Empty]]
      updatedBoard = Board.update Board.empty (1, 0) X
      in TestCase $ assertEqual "can be updated" (Just expectedBoard) updatedBoard

boardUpdateError =
  let board = [[Empty, Empty, Empty],
               [X,     Empty, Empty],
               [Empty, Empty, Empty]]
      updatedBoard = Board.update Board.empty (1, 0) O
      in TestCase $ assertEqual "can't be updated" Nothing updatedBoard

-- viewBoard =
--   let board = newBoard [[Empty, Empty, Empty],
--                         [X,     Empty, Empty],
--                         [Empty, O,     Empty]]
--       expected = "     A   B   C\n" ++
--                  "  1    |   |  \n" ++
--                  "    ---+---+---\n" ++
--                  "  2  X |   |  \n" ++
--                  "    ---+---+---\n" ++
--                  "  3    | O |  "
--   in TestCase $ assertEqual "can show" expected $ showBoard board

gameIsOn =
  let board = [[Empty, X, X], [X, Empty, X], [O, Empty, O]]
      in TestCase $ assertEqual "game is on" GameIsOn $ gameStatus board
xWon =
  let board = [[Empty, X, X], [X, Empty, X], [O, Empty, X]]
      in TestCase $ assertEqual "X won" XWon $ gameStatus board
oWonDiagonally =
  let board = [[O, X, X], [X, O, X], [O, Empty, O]]
      in TestCase $ assertEqual "O won" OWon $ gameStatus board
aDraw =
  let board = [[O, X, O],
               [O, O, X],
               [X, O, X]]
      in TestCase $ assertEqual "A draw" Draw $ gameStatus board

tests = TestList [TestLabel "Board can be updated" boardUpdate,
                  TestLabel "Board can be updated" boardUpdateError,
                  TestLabel "Game status" gameIsOn,
                  TestLabel "Game status" xWon,
                  TestLabel "Game status" oWonDiagonally,
                  TestLabel "Game status" aDraw]
