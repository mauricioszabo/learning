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
        ].
        
        tabuleiro imprimirTabuleiro.
        Transcript 
            showCr: '';
            showCr: (tabuleiro mensagemFinal).
    ]

    processarJogada [
        |x y match|
        match := stdin nextLine =~ '^([ABC])([123])$'.
        match ifNotMatched: [ ^self erroJogada ].
        x := ((match at: 1) byteAt: 1) - 64.
        y := (match at: 2) asInteger.
        (tabuleiro preencherX: x y: y) ifFalse: [
            Transcript showCr: 'Quadrado já está preenchido!'.
        ].
    ]

    erroJogada [
        Transcript showCr: 'Erro na jogada: jogada deve ser A1, A2, B2, etc.'.
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
