# Clojure

~~Lisp~~ Clojure é uma linguagem... interessante talvez.

Ao contrário de Lisp (e da minha brincadeirinha acima), Clojure só se parece com Lisp na teoria. Na prática as coisas são um pouco diferentes - coisas são mais fáceis, coisas são mais difíceis.

Uma das coisas que Clojure manteve de Lisp (e que eu acho quase insuportável) é que os `let` não são avaliados em ordem. Então, é impossível fazer algo como:

```clojure
(let [[a 1] [b (+ a 10)]] b)
```

Pois isso é erro de declaração - `b` não sabe da existência de `a`. Agora, uma das coisas que Clojure **não manteve** de Lisp foi a ~~aberração~~ confusão das operações com tipos diferentes de coleções. Por exemplo, em Lisp, pegar o primeiro elemento de um vetor é `(svref <vector> 0`, enquanto com listas é `(car <list>`. Strings são vectors em Lisp, mas se acessa os elementos com `aref`, então as coisas são estranhas para uma linguagem dinâmicas. Já em Clojure, acessar o primeiro elemento é sempre `(first <collection>)`, o que facilita as coisas (e acaba com nomes nojentos tipo `car` e `cdr`, que se mantiveram por razões históricas).

*Ao mesmo tempo*, Clojure tem suas próprias aberrações. Em Lisp, tudo é parênteses. Isso é estranho, mas na teoria, torna a linguagem constante - se você for declarar uma função, os argumentos são com parênteses. Se você for usar um `let`, usa-se parênteses. Colchetes são apenas um sinônimo. Já em Clojure, há uma sintaxe especial - `['one 'vector]` é um vector, `'(one list)` é uma lista, `{one map}` é um mapa, `#(one "function" %)` é uma função que chama `one` nos parâmetros `"function"` e um parâmetro adicional que o usuário pode passar, e assim vai. Isso me pareceu **bem** estranho para uma linguagem Lisp-like - uma linguagem que, basicamente, se esforça para não ter inconsistência nenhuma, nenhum construtor especial, etc. Isso, para ser sincero, me assusta um pouco na linguagem - sinto que ela tem uma tendência de ficar um ~~PHP~~ Frankstein. Outra coisa **bizarra** para mim foi a ausência do `!=`...

Houveram coisas **animais** na linguagem. A primeira dela, a maneira como se transpoe a lista de listas do tabuleiro: `(apply map vector board)`. Como `map` recebe dois **ou mais** parâmetros - uma função a ser aplicada, e uma **ou mais** coleções, o `apply` nada mais vai fazer do que passar cada *linha* do nosso tabuleiro para o `map`. Então, o `map` vai pegar o primeiro elemento de **todas** as coleções passadas, e aplicar a função que passamos - no caso, `vector`, que cria um novo vetor. Seria equivalente a isso:

```clojure
(def v [[1 2] [3 4]])
(list
  (vector 1 3)
  (vector 2 4))
; Retorna (list [1 3] [2 4])
```

O "*problema*" é que o `map` (e a maior parte das funções em coleções) retornam uma `list`... problema? A vantagem de uma lista em Clojure é que ela é **sempre** lazy - e todas as operações que se fazem nela também o são. Mesmo o `map` o é:

```clojure
(def infinite-list-of-numbers (range))
(def evens (map (partial * 2) infinite-list-of-numbers))
(take 3 evens) ; => (0 2 4)
```

Outras coisas legais da linguagem são a comparação com `(= quanto elementos eu quiser)`, que permitiu fazer o `matches-line` de uma forma bem clever: `(and (apply = row) (!= (first row) " ")))`. Basicamente, aplico a função `=` na linha toda, e depois só checo se o elemento não é branco. É possível ver como isso é fantástico na forma como eu comparei os diagonais - acho que de todos, o código do diagonal foi o mais limpo em Clojure.

Agora... a recursão...

Clojure não ajuda na *Tail Recursion Optimization*. Simples assim. Ao contrário de Scala, que resolveu ~~fazer a coisa certa e~~ deixar isso transparente para o programador, em Clojure ele tem um formato chamado de `trampoline`. A idéia do `trampoline` é meio confusa: ele chama seu código e monitora para ver se ele retornou uma função. Em caso positivo, ele chama essa função sem argumentos, até que não retorne uma função. Com exemplos fica mais fácil: pensemos no caso do Fatorial, com o acumulador. Primeiro, a versão que **não otimiza** a tail call:

```clojure
(defn factorial [n]
  (
    (fn helper [x acc]
      (if (= x 0)
        acc
        (helper (- x 1) (* acc x))))
    n 1))
```

A sintaxe é um pouco estranha: na segunda linha, abrimos um parênteses para indicar que vamos chamar uma função. A função que vamos chamar, a gente define na linha 3, com a palavra-chave `fn`, e demos um nome de `helper` para que possamos fazer a recursão. Aí, nas linha abaixo calculamos o fatorial, como de costume, e por fim, na linha 6 fazemos a tail call (chamando só a função helper, sem depender de nada a mais) e depois na linha 7, chamamos a função definida acima com os parâmetros *n* e *1*.

Só que Clojure não identifica a *tail call*. Para que ele identificasse, teríamos que retornar, na última linha, uma função que, se fosse chamada sem nenhum parâmetro, aí sim faria a recursão. É fácil de fazer isso colocando um `#` antes dos parênteses:

```clojure
(defn factorial [n]
  (trampoline
    (fn helper [x acc]
      (if (= x 0)
        acc
        #(helper (- x 1) (* acc x))))
        ; A linha acima é equivalente a:
        ; (fn [] (helper (- x 1) (* acc x)))))
    n 1))
```

Repare que ao invés de simplesmente abrirmos um parênteses na linha 2, agora chamamos com `trampoline`. Isso otimiza o *tail call* para nós...

Porque recursão não é complicado o suficiente só por ser, né? Precisamos complica mais ainda...
