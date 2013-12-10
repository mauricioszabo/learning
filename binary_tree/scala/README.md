# Árvore Binária

Scala suporta o paradigma orientado a objetos, funcional, possui suporte para Pattern Match e suporte para atores usando a biblioteca Akka. A vantagem é a possibilidade de identificar diferenças nos paradigmas de programação usando o conceito de árvore binária.

A primeira tentativa foi usar a versão orientada a objeto, completamente mutável. Nessa versão, originalmente, há uma árvore (`Tree`), que contém nós (`Node`s). Inicialmente, a árvore possui raíz vazia, e na primeira inserção, ela cria um nó na raíz, e define `left` e `right` como nulos. A partir daí, quando for feita uma inserção, percorre a árvore até achar um nó nulo, e o insere.

A primeira versão funcional, na verdade, continuava com a idéia do nulo (usando a monad Option). A idéia foi basicamente uma versão imutável da versão orientada a objetos, e consequentemente, continuava orientada a objetos (logo, chamei-a de Immutable.scala).

A segunda versão funcional foi depois de mexer na versão de Haskell. A idéia é criar uma estrutura de dados para árvores (`Tree`), de forma mais declarativa: Uma árvore ou é vazia (`EmptyTree`) ou é um nó contendo outras árvores (`Node`). Uma árvore com um elemento, basicamente, é um nó com `left` e `right` contendo `EmptyTree`.

A terceira versão funcional aproveita-se da idéia de classes abstratas e pattern match para separar melhor a lógica.
