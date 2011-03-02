FileStream fileIn: 'Tabuleiro.st'.

Object subclass: Main [
    |tabuleiro|
    init [
        tabuleiro := Tabuleiro new.
    ]

    jogar [
        [ tabuleiro jogoAcabou ] whileFalse: [
            tabuleiro imprimirTabuleiro.
            self processarJogada.
        ]
    ]

    processarJogada [
        |x y match|
        match := stdin nextLine =~ '^([ABC])([123])$'.
        x := ((match at: 1) byteAt: 1) - 64.
        y := (match at: 2) asInteger.
        (tabuleiro preencherX: x y: y) ifFalse: [
            Transcript showCr: 'Quadrado já está preenchido!'.
        ].
    ]

]

Main class extend [
    new [
        |s|
        s := super new.
        s init.
        ^s
    ]
]

Main new jogar.
