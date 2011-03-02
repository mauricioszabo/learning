Object subclass: Tabuleiro [
    |tabuleiro matriz jogador mensagemFinal|
    init [
        tabuleiro := #(
            '     A   B   C '
            '  1    |   |   '
            '    ---+---+---'
            '  2    |   |   '
            '    ---+---+---'
            '  3    |   |   '
        ).
        jogador := 'X'.
        matriz := #( #(nil nil nil) #(nil nil nil) #(nil nil nil)  ).
    ]

    imprimirTabuleiro [
        Transcript showCr: ''.
        tabuleiro do: [ :t | Transcript showCr: t ].
        Transcript showCr: ''.
        Transcript show: 'Jogador ', jogador, ', sua jogada? '.
    ]

    preencherX: x y: y [
        ((matriz at: x) at: y) isNil ifFalse: [ ^false ].
        (matriz at: x) at: y put: jogador.
        ^true
    ]

    jogoAcabou [
        ^false
    ]
]

Tabuleiro class extend [
    new [
        |s|
        s := super new.
        s init.
        ^s
    ]
]
