TYPE Tabuleiro
    Tabuleiro(5) AS STRING
    Jogador AS STRING = "X"
    Matriz(2, 2) AS STRING
    MensagemFinal AS STRING = ""
END TYPE

CONST TRUE = -1
CONST FALSE = 0
DECLARE SUB IniciarTabuleiro(T() AS STRING, Matriz() AS STRING)
DECLARE SUB Jogar(T AS Tabuleiro)
DECLARE SUB ImprimirTabuleiro(T AS Tabuleiro)
DECLARE SUB ProcessarJogada(T AS Tabuleiro)
DECLARE FUNCTION JogadaInvalida(Jogada AS STRING) AS INTEGER
DECLARE FUNCTION PreencherTabuleiro(T AS Tabuleiro, X AS INTEGER, Y AS INTEGER) AS INTEGER
DECLARE FUNCTION JogoAcabou(T AS Tabuleiro) AS INTEGER
DECLARE FUNCTION MensagemFinal(T AS Tabuleiro) AS STRING
DECLARE FUNCTION HorizontaisOuVerticaisIguais(Matriz() AS STRING) AS STRING
DECLARE FUNCTION Iguais(Matriz() AS STRING, x AS INTEGER) AS STRING
DECLARE SUB Transpose(Original() AS STRING, Transposta() AS STRING)
DECLARE FUNCTION DiagonaisIguais(Matriz() AS STRING) AS STRING
DECLARE FUNCTION TodosPreenchidos(Matriz() AS STRING) AS INTEGER

DIM Tabu as Tabuleiro

IniciarTabuleiro(Tabu.Tabuleiro(), Tabu.Matriz())
Jogar(Tabu)

SUB IniciarTabuleiro(T() AS STRING, Matriz() AS STRING)
    DIM x AS INTEGER, y AS INTEGER
    T(0) = "     A   B   C "
    T(1) = "  1    |   |   "
    T(2) = "    ---+---+---"
    T(3) = "  2    |   |   "
    T(4) = "    ---+---+---"
    T(5) = "  3    |   |   "
    FOR x = 0 TO 2
        FOR y = 0 TO 2
            Matriz(x, y) = ""
        NEXT y
    NEXT x
END SUB

SUB Jogar(T AS Tabuleiro)
    WHILE NOT JogoAcabou(T)
        ImprimirTabuleiro(T)
        ProcessarJogada(T)
    WEND
    ImprimirTabuleiro(T)
    PRINT
    PRINT
    PRINT MensagemFinal(T)
END SUB

SUB ImprimirTabuleiro(T AS Tabuleiro)
    DIM x AS INTEGER
    FOR x = 0 TO 5
        PRINT T.Tabuleiro(x)
    NEXT
    PRINT "Jogador " + T.Jogador + ", sua jogada? ";
END SUB

SUB ProcessarJogada(T AS Tabuleiro)
    DIM Jogada AS STRING
    INPUT "", Jogada
    IF(JogadaInvalida(Jogada)) THEN
        PRINT "Erro na jogada: jogada deve ser A1, A2, B2, etc."
        RETURN
    END IF

    DIM x AS INTEGER, y AS INTEGER
    x = ASC(MID(Jogada, 1, 1)) - ASC("A")
    y = VAL(MID(Jogada, 2, 1)) - 1
    IF(NOT PreencherTabuleiro(T, x, y)) THEN
        PRINT "Quadrado já está preenchido!"
    END IF
END SUB

FUNCTION JogadaInvalida(Jogada AS STRING) AS INTEGER
    DIM C1 AS STRING, C2 AS STRING
    C1 = MID(Jogada, 1, 1)
    C2 = MID(Jogada, 2, 1)

    JogadaInvalida = FALSE
    IF((NOT C1 = "A") AND (NOT C1 = "B") AND (NOT C1 = "C")) THEN JogadaInvalida = TRUE
    IF((NOT C2 = "1") AND (NOT C2 = "2") AND (NOT C2 = "3")) THEN JogadaInvalida = TRUE
END FUNCTION

FUNCTION PreencherTabuleiro(T AS Tabuleiro, X AS INTEGER, Y AS INTEGER) AS INTEGER
    IF(NOT T.Matriz(X, Y) = "") THEN RETURN FALSE
    T.Matriz(X, Y) = T.Jogador
    Y = Y * 2 + 1
    X = X * 4 + 6
    MID(T.Tabuleiro(y), X, 1) = T.Jogador
    IF(T.Jogador = "X") THEN
        T.Jogador = "O"
    ELSE
        T.Jogador = "X"
    END IF
    PreencherTabuleiro = TRUE
END FUNCTION

FUNCTION JogoAcabou(T AS Tabuleiro) AS INTEGER
    IF MensagemFinal(T) = "" THEN
        JogoAcabou = FALSE
    ELSE
        JogoAcabou = TRUE
    END IF
END FUNCTION

FUNCTION MensagemFinal(T AS Tabuleiro) AS STRING
    IF T.MensagemFinal = "" THEN
        DIM h AS STRING
        h = HorizontaisOuVerticaisIguais(T.Matriz())
        IF h = "" THEN h = DiagonaisIguais(T.Matriz())
        IF NOT h = "" THEN
            T.MensagemFinal = h + " Venceu!"
        ELSEIF TodosPreenchidos(T.Matriz()) THEN
            T.MensagemFinal = "Deu velha!"
        END IF
    END IF
    MensagemFinal = T.MensagemFinal
END FUNCTION

FUNCTION HorizontaisOuVerticaisIguais(Matriz() AS STRING) AS STRING
    DIM i AS INTEGER
    DIM Elemento AS STRING
    FOR i = 0 TO 2
        Elemento = Iguais(Matriz(), i)
        IF NOT Elemento = "" THEN RETURN Elemento
    NEXT

    DIM Transposta(2, 2) AS STRING
    Transpose(Matriz(), Transposta())
    FOR i = 0 TO 2
        Elemento = Iguais(Transposta(), i)
        IF NOT Elemento = "" THEN RETURN Elemento
    NEXT

    RETURN ""
END FUNCTION

FUNCTION Iguais(Matriz() AS STRING, x AS INTEGER) AS STRING
    DIM i AS INTEGER
    DIM Elemento AS STRING = Matriz(x, 0)
    FOR i = 1 TO 2
        IF NOT Elemento = matriz(x, i) THEN RETURN ""
    NEXT

    RETURN elemento
END FUNCTION

SUB Transpose(Original() AS STRING, Transposta() AS STRING)
    DIM x AS INTEGER, y AS INTEGER
    FOR x = 0 TO 2
        FOR y = 0 TO 2
            Transposta(y, x) = Original(x, y)
        NEXT y
    NEXT x
END SUB

FUNCTION DiagonaisIguais(Matriz() AS STRING) AS STRING
    IF (Matriz(0,0) = Matriz(1,1)) AND (Matriz(1,1) = Matriz(2,2)) THEN RETURN Matriz(0,0)
    IF (Matriz(0,2) = Matriz(1,1)) AND (Matriz(1,1) = Matriz(2,0)) THEN RETURN Matriz(0,2)
    RETURN ""
END FUNCTION

FUNCTION TodosPreenchidos(Matriz() AS STRING) AS INTEGER
    DIM x AS INTEGER, y AS INTEGER
    FOR x = 0 TO 2
        FOR y = 0 TO 2
            IF Matriz(x, y) = "" THEN RETURN FALSE
        NEXT y
    NEXT x
    RETURN TRUE
END FUNCTION
