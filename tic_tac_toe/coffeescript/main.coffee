tab = require './tabuleiro'

class Main
    tabuleiro = 0
    constructor: ->
        tabuleiro = new tab.Tabuleiro()
        tabuleiro.imprimirTabuleiro()
        process.stdin.resume()
        process.stdin.on 'data', (jogada) =>
            @jogar jogada.toString()

    jogar: (jogada) ->
        @processarJogada jogada unless tabuleiro.jogoAcabou()
        tabuleiro.imprimirTabuleiro()
        if tabuleiro.jogoAcabou()
            console.log tabuleiro.mensagemFinal()
            process.stdin.pause()

    processarJogada: (j) ->
        jogada = j.match /^([ABC])([123])\n?$/
        return @erroJogada() unless jogada?
        x = jogada[1].charCodeAt(0) - 65
        y = jogada[2] - 1
        unless tabuleiro.preencher(x, y)
            console.log "Quadrado já está preenchido!"

    erroJogada: ->
        console.log "Erro na jogada: jogada deve ser A1, A2, B2, etc."

main = new Main()
