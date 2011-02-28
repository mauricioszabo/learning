tab = exports

class tab.Tabuleiro
    tabuleiro = "\n
       A   B   C \n
    1    |   |   \n
      ---+---+---\n
    2    |   |   \n
      ---+---+---\n
    3    |   |   \n
    "
    jogador = 'X'
    matriz = [ [], [], [] ]
    mensagemFinal = null

    constructor: ->
        tabuleiro = tabuleiro.split "\n"

    imprimirTabuleiro: ->
        for t in tabuleiro
            console.log(t)
        process.stdout.write "Jogador #{jogador}, sua jogada? "

    preencher: (x, y) ->
        return false if matriz[x][y]?
        matriz[x][y] = jogador
        x = x * 4 + 6
        y = y * 2 + 2
        tabuleiro[y] = "#{tabuleiro[y].slice(0, x+1)}#{jogador}#{tabuleiro[y].slice(x+2)}"
        jogador = if jogador == 'X' then 'O' else 'X'
        return true

    jogoAcabou: -> @mensagemFinal()?

    mensagemFinal: ->
        mensagemFinal ||= (->
            h = horizontaisOuVerticaisIguais()
            h ||= diagonaisIguais()
            if h?
                "#{h} Venceu!"
            else if todosPreenchidos()
                "Deu velha!"
        )()

    horizontaisOuVerticaisIguais = ->
        for m in matriz
            if (match = m.join('').match(/(X{3}|O{3})/))
                return match[0][0]

        transposta = [ [], [], [] ]
        for x in [0..2]
            for y in [0..2]
                transposta[x][y] = matriz[y][x]

        for m in transposta
            if (match = m.join('').match(/(X{3}|O{3})/))
                return match[0][0]
    
        return null

    diagonaisIguais = ->
        return matriz[0][0] if(matriz[0][0] == matriz[1][1] == matriz[2][2])
        return matriz[0][2] if(matriz[0][2] == matriz[1][1] == matriz[2][0])

    todosPreenchidos = ->
        for x in [0..2]
            for y in [0..2]
                return false unless matriz[x][y]?
        return true
