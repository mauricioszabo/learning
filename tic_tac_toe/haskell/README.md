# Haskell

A primeira versão que eu fiz desse jogo da velha ficou bem estranha - `if`s aninhados,
muitas funções que dependem do `IO`, etc. Depois as coisas foram ficando mais claras, e
cheguei na versão atual do jogo (aproveitando pra mudar para inglês os códigos).

Haskell tem umas peculiaridades. Na primeira tentativa, usei `Vector`, mas o pattern-match
não funciona com Vector (inclusive, isso é a coisa que eu mais sinto falta de Scala em
todas as linguagens que eu uso: pattern-match extensível). Além disso, já existe
`transpose` implementado pra `List`, então acabei continuando com essa abordagem. Há
algumas pequenas armadilhas também: o que as outras linguagens chamam de `map`, Haskell
chama de `fmap`; outro exemplo é a tipagem poderosa de Haskell que às vezes a gente joga
fora para usar strings como "enum" (talvez pra evitar digitar coisas como
`data GameStatus = XWon | YWOn ...`). Esses são vícios que me perseguiram nesse código.

O problema de Haskell é entender os conceitos por trás da linguagem - Monads, por exemplo.
A própria notação `do`, que é uma syntax-sugar para a função `>>=`. Entender essas
peculiaridades me permitiu, nessa versão, usar `fmap` pra tratar a leitura da jogada no
código, deixando coisas mais enxutas e podendo usar menos condicionais.

Em comparação com o código anterior que eu fiz, há menos `if`s e `case`s: 1 `if` e 4
`case` para o código todo, e nenhum deles aninhado, comparado com os 12 `if` do código
anterior. Isso tudo por causa do uso de lazy evaluation, que é a menção de honra da
linguagem: o exemplo fantástico disso é a função `gameTurn`, que basicamente renderiza uma
jogada completa. Ela tem 3 dependências: se o estado atual (tabuleiro) é uma posição
final, seja porque um dos jogadores venceu ou porque não há mais nenhuma jogada válida,
temos que terminar o jogo; caso contrário, temos que pedir uma jogada, e validar a jogada.
Se ela for inválida, temos que tentar novamente; se ela for válida, temos que tentar
atualizar o tabuleiro, e se a jogada for numa posição válida, trocar o jogador/atualizar.
São muitos `if`s que ficaram assim no resultado final:

```haskell
  case step of
    (Draw, _, _) -> putStrLn "\nGame ended in a draw"
    (XWon, _, _) -> putStrLn "\nX won!"
    (OWon, _, _) -> putStrLn "\nO won!"
    (_, Nothing, _) -> wrongMove
    (_, _, Nothing) -> alreadyMarked
    (_, _, Just newBoard) -> gameTurn newBoard otherPlayer
```

Porque Haskell interpreta tudo de forma lazy - logo, `step` só precisa retornar uma tripla
`(GameState, Maybe Movement, Maybe Board)`, e precisamos checar na ordem certa. No geral,
assumimos que tudo funciona: o usuário digitou uma jogada válida (se não, o segundo
elemento é Nothing) e conseguimos atualizar o tabuleiro (se não, o terceiro elemento é
Nothing). Se checarmos na ordem correta (primeiro o estado, segundo a jogada, terceiro o
tabuleiro), Haskell não tenta interpretar os próximos estados e no geral as coisas
funcionam...

Lazyness é algo bem poderoso...
