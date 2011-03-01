var tab = require('./tabuleiro');

function createMain() {
    var tabuleiro;
    var o = new Function();
    var p = o.prototype;
    var tabuleiro = tab.criarTabuleiro();
    var jogar, processarJogada, erroJogada;

    tabuleiro.imprimirTabuleiro();
    process.stdin.resume();
    process.stdin.on('data', function(jogada) {
        jogar(jogada.toString());
    });

    jogar = function(jogada) {
        if(!tabuleiro.jogoAcabou()) processarJogada(jogada);
        tabuleiro.imprimirTabuleiro();
        if(tabuleiro.jogoAcabou()) {
            console.log(tabuleiro.mensagemFinal());
            process.stdin.pause();
        }
    };

    processarJogada = function(j) {
        jogada = j.match(/^([ABC])([123])\n?$/);
        if(!jogada) return erroJogada();
        x = jogada[1].charCodeAt(0) - 65;
        y = jogada[2] - 1;
        if(!tabuleiro.preencher(x, y)) console.log("Quadrado já está preenchido!");
    };

    erroJogada = function() {
        console.log("Erro na jogada: jogada deve ser A1, A2, B2, etc.");
    };

    p.jogar = jogar;
    p.processarJogada = processarJogada;
    p.erroJogada = erroJogada;
    return new o();
}

main = createMain();
