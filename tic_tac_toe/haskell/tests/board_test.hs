module BoardTest where
import Test.HUnit
import Data.Vector as Vector (toList, fromList, Vector)
import Data.List as List
import Board

newBoard :: [[Mark]] -> Vector (Vector Mark)
newBoard board = fromList $ List.map fromList board

boardUpdate =
  let expectedBoard = newBoard [[Empty, Empty, Empty],
                                [X,     Empty, Empty],
                                [Empty, Empty, Empty]]
      updatedBoard = Board.update Board.empty (1, 0) X
      in TestCase $ assertEqual "can be updated" expectedBoard updatedBoard

viewBoard =
  let board = newBoard [[Empty, Empty, Empty],
                        [X,     Empty, Empty],
                        [Empty, O,     Empty]]
      expected = "        A  B  C\n" ++
                 "  1    |   | \n" ++
                 "    ---+---+---\n" ++
                 "  2  X |   | \n" ++
                 "    ---+---+---\n" ++
                 "  3    | O | "
  in TestCase $ assertEqual "can show" expected $ showBoard board

tests = TestList [TestLabel "Board can be updated" boardUpdate,
                  TestLabel "Board can be shown" viewBoard]
