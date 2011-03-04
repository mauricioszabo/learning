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

mensagemFinal :: Matriz -> String 
mensagemFinal matriz = let h = horizontaisOuVerticaisIguais matriz
    in if h /= ""
        then mensagem h
        else let h2 = diagonaisIguais matriz
            in if h2 /= ""
                then mensagem h2
                else todosPreenchidos matriz

mensagem h = if h /= ""
    then h ++ " Venceu!"
    else ""

horizontaisOuVerticaisIguais :: Matriz -> String
horizontaisOuVerticaisIguais matriz = if todosIguais matriz == ""
    then todosIguais $ transpose matriz
    else todosIguais matriz
--horizontaisOuVerticaisIguais matriz = todosIguais (matriz ++ transpose matriz)

diagonaisIguais :: Matriz -> String
diagonaisIguais matriz = todosIguais diagonais
    where diagonais = [[ matriz!!y!!x | (x, y) <- zip [0..2] [0..2] ], [ matriz!!y!!x | (x, y) <- zip [2,1,0] [0..2] ]]

todosIguais :: Matriz -> String
todosIguais matriz = let unicos = [ nub e | e <- matriz, not $ any (==" ") e ]
    in if any (tamanhoIgualA1) unicos
        then unicos !! 0 !! 0
        else ""
    where tamanhoIgualA1 matriz = length matriz == 1

todosPreenchidos :: Matriz -> String
todosPreenchidos matriz = if any (==" ") $ concat matriz
    then ""
    else "Deu velha!"
