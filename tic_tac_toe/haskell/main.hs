import Tabuleiro
import Text.Regex
import Data.Maybe
import Data.Char

main :: IO ()
main = jogar matrizInicial "X"

matrizInicial :: Matriz
matrizInicial = [ [" ", " ", " "], [" ", " ", " "], [" ", " ", " "] ]
--matrizInicial = [ ["1", "2", "3"], ["4", "5", "6"], ["7", "8", "9"] ]

jogar :: Matriz -> String -> IO ()
jogar matriz jogador = do
    imprimirTabuleiro matriz jogador
    jogada <- getLine
    let xy = processarJogada (jogada)
    if xy == (-1, -1)
        then exibirErro "Erro na jogada: jogada deve ser A1, A2, B2, etc." matriz jogador
        else if mensagemErro matriz == ""
            then do
                let novaMatriz = preencher xy matriz jogador
                if novaMatriz == matriz
                    then exibirErro "Quadrado já está preenchido!" matriz jogador
                    else jogar novaMatriz (if jogador == "X" then "O" else "X")
            else putStrLn "Cabei!"

processarJogada :: String -> (Int, Int)
processarJogada jogada =
    let match = matchRegex (mkRegex "^([ABC])([123])$") jogada
    in if isNothing match
        then (-1, -1)
        else 
            let xy = fromJust match
            in (ord (xy !! 0 !! 0) - 65, (read $ xy !! 1) - 1)

exibirErro :: String -> Matriz -> String -> IO () 
exibirErro mensagem matriz jogador = do
    putStrLn mensagem
    jogar matriz jogador

