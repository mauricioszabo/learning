module Tabuleiro where
import Data.List
import IO
type Matriz = [[String]]

imprimirTabuleiro :: Matriz -> String -> IO ()
imprimirTabuleiro matriz jogador = do
    putStrLn "\n     A   B   C"
    let lines = [ "  " ++ show i ++ "  " ++ (concat $ intersperse " | " e) | (i,e) <- zip [1..] matriz ]
    let string = unlines $ intersperse "    ---+---+---" lines
    putStrLn string
    putStr ("Jogador " ++ jogador ++ ", sua escolha? ")
    hFlush stdout

preencher :: (Int, Int) -> Matriz -> String -> Matriz
preencher xy matriz jogador = let (x,y) = xy
    in if matriz !! y !! x == " "
        then substituir xy jogador matriz
        else matriz

substituir :: (Int, Int) -> String -> Matriz -> Matriz
substituir index newElement matriz = 
    let (y, x) = index
    in replaceElement x (replaceElement y newElement (matriz !! x)) matriz

replaceElement :: Int -> a -> [a] -> [a]
replaceElement index newElement matriz = 
    let (ys,zs) = splitAt index matriz 
    in ys ++ [newElement] ++ (tail zs)

mensagemErro matriz = ""
