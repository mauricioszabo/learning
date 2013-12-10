# Árvore Binária

Scala suporta o paradigma orientado a objetos, funcional, possui suporte para Pattern Match e suporte para atores usando a biblioteca Akka. A vantagem é a possibilidade de identificar diferenças nos paradigmas de programação usando o conceito de árvore binária.

A primeira tentativa foi usar a versão orientada a objeto, completamente mutável. Nessa versão, originalmente, há uma árvore (`Tree`), que contém nós (`Node`s). Inicialmente, a árvore possui raíz vazia, e na primeira inserção, ela cria um nó na raíz, e define `left` e `right` como nulos. A partir daí, quando for feita uma inserção, percorre a árvore até achar um nó nulo, e o insere.

A primeira versão funcional, na verdade, continuava com a idéia do nulo (usando a monad Option). A idéia foi basicamente uma versão imutável da versão orientada a objetos, e consequentemente, continuava orientada a objetos (logo, chamei-a de Immutable.scala).

A segunda versão funcional foi depois de mexer na versão de Haskell. A idéia é criar uma estrutura de dados para árvores (`Tree`), de forma mais declarativa: Uma árvore ou é vazia (`EmptyTree`) ou é um nó contendo outras árvores (`Node`). Uma árvore com um elemento, basicamente, é um nó com `left` e `right` contendo `EmptyTree`.

A terceira versão funcional aproveita-se da idéia de classes abstratas e pattern match para separar melhor a lógica.


## Programação Reativa
A parte interessante é quando usamos Akka para fazer a inserção. A partir daí, duas inserções podem ser ao mesmo tempo, enviando mensagens. A idéia é exatamente a mesma da versão funcional, exceto que nesse caso temos algumas mudanças no paradigma: em primeiro lugar, cada árvore (`Tree`) é um ator (`ActorRef`), que recebe mensagens. As mensagens, nesse caso, são `Insert` (que inclui um item na lista) e `Fn` (que roda uma função para cada elemento da árvore, em ordem crescente).

Cada `Tree` possui dois comportamentos: ou ela se comporta como `empty` ou como `node`. Quando ela se comporta como `empty`, a inserção apenas a transforma em `node`. Quando ela se comporta como `node`, a inserção verifica se o elemento é menor ou maior que o valor atual, e emite o sinal de "Insert" para o nó correspondente. Isso torna a implementação interessante pois diferentes inserções podem estar "caminhando" na árvore em paralelo, e consequentemente a inserção não é blocante. Quando terminada a inserção, a árvore emite um `Inserted` para o seu pai, que caminha até chegar a quem enviou o sinal em primeiro momento.

O sinal de `Fn`, entretanto, é mais complicado: como ele necessita ser processado na ordem, todo sinal `Fn` que chega é cacheado na variável `pendingFns`. Quando ele é processado ele envia um sinal `Finished`. O processo completo é:

1. Recebe o sinal `Fn`
1. Cacheia a função
1. Envia o sinal `Fn` para o filho à esquerda
1. Recebe o sinal de `Finished`, e processa a função
1. Remove o cache do sinal, e envia o sinal `Fn` para a direita
1. Recebe o sinal de `Finished`, e repassa o `Finished` para o pai.

Apesar de parecer linear, a implementação não é completamente linear também. Isso porque o sinal `Fn` pode trafegar em paralelo com outro sinal `Fn`, ou seja, dois sinais podem estar percorrendo a árvore ao mesmo tempo. A parte interessante desta abordagem é que como os sinais estão trafegando a mesma árvore na mesma ordem, um não interfere no resultado do outro.

NOTA: O código compila com warnings devido ao erasure da JVM. Por motivo de simplicidade, resolvi não deixar o modelo type-safe.
