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
        |tab x1 y1|
        ((matriz at: x) at: y) isNil ifFalse: [ ^false ].
        (matriz at: x) at: y put: jogador.

        y1 := y * 2.
        x1 := x * 4 + 2.
        tab := tabuleiro at: y1.
        tabuleiro at: y1 put: (tab copyFrom: 1 to: x1 - 1), jogador, (tab copyFrom: x1 + 1).
        jogador := (jogador = 'X') ifTrue: [ 'O' ] ifFalse: [ 'X' ].
        ^true
    ]

    jogoAcabou [
        ^self mensagemFinal notNil.
    ]

    mensagemFinal [
        |h|
        mensagemFinal notNil ifTrue: [ ^mensagemFinal ].
        h := self horizontaisOuVerticaisIguais.
        h isNil ifTrue: [ h := self diagonaisIguais. ].
        h notNil ifTrue: [
            mensagemFinal := h, ' Venceu!'.
        ] ifFalse: [ self todosPreenchidos ifTrue: [
            mensagemFinal := 'Deu velha!'.
        ]].
        ^mensagemFinal.
    ]

    horizontaisOuVerticaisIguais [
        |comp|
        comp := [ :m |
            (m allSatisfy: [ :e | e notNil ]) ifTrue: [
                (m asSet size = 1) ifTrue: [ 
                    Transcript showCr: 'Blah!'.
                    ^m first 
                ]
            ].
        ].

        
        matriz do: [ :m | comp value: m ].
        matriz transpose do: comp.
        ^nil
    ]

    diagonaisIguais [
        |m|
        m := (matriz at:2) at: 2.
        (((matriz at:1) at:1) = m & ((matriz at:3) at:3) = m ) ifTrue: [ ^m ].
        (((matriz at:1) at:3) = m & ((matriz at:3) at:1) = m ) ifTrue: [ ^m ].
        ^nil
    ]

    todosPreenchidos [
        ^matriz allSatisfy: [ :e| e allSatisfy: [ :e2| e2 notNil ] ].
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

Array extend [
    transpose [
        |other|
        "Stupid Gnu Smalltalk..."
        other := (Array new: 3) collect: [ :t | Array new: 3 ].
        1 to: 3 do: [ :x |
            1 to: 3 do: [ :y |
                (other at: x) at: y put: ((self at: y) at: x).
            ].
        ].
        ^other
    ]
]
