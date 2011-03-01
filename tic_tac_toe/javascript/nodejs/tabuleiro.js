tab = exports

tab.criarTabuleiro = function() {
    var o = new Function();
    var p = o.prototype;
    var tabuleiro = "\n" +
"       A   B   C \n" +
"    1    |   |   \n" +
"      ---+---+---\n" +
"    2    |   |   \n" +
"      ---+---+---\n" +
"    3    |   |   \n";

    var jogador = 'X';
    var matriz = [ [], [], [] ];
    var m_mensagemFinal;
    var imprimirTabuleiro, preencher, jogoAcabou;
    
    tabuleiro = tabuleiro.split("\n");

    imprimirTabuleiro = function() {
        tabuleiro.forEach( function(t) {
            console.log(t);
        });
        process.stdout.write("Jogador " + jogador + ", sua jogada? ");
    };
    p.imprimirTabuleiro = imprimirTabuleiro;

    preencher = function(x, y) {
        if(matriz[x][y]) return false;
        matriz[x][y] = jogador;
        x = x * 4 + 6;
        y = y * 2 + 2;
        tabuleiro[y] = tabuleiro[y].slice(0, x+1) + jogador + tabuleiro[y].slice(x+2);
        jogador = jogador == 'X' ? 'O' : 'X';
        return true;
    };
    p.preencher = preencher;

    jogoAcabou = function() {
        console.log(mensagemFinal());
        return mensagemFinal() != undefined;
    };
    p.jogoAcabou = jogoAcabou;

    mensagemFinal = function() {
        m_mensagemFinal = (m_mensagemFinal || (function() {
            var h = horizontaisOuVerticaisIguais();
            h = (h || diagonaisIguais());
            if(h) {
                return h + " Venceu!";
            } else if(todosPreenchidos()) {
                return "Deu velha!";
            }
        })());
        return m_mensagemFinal;
    };
    p.mensagemFinal = mensagemFinal;

    horizontaisOuVerticaisIguais = function() {
        var transposta, x, y, i;

        for(i = 0; i < matriz.length; i++) {
            var match = matriz[i].join('').match(/(X{3}|O{3})/);
            if(match) return match[0][0];
        }

        transposta = [ [], [], [] ];
        for(x = 0; x < 3; x++) {
            for(y = 0; y < 3; y++) {
                transposta[x][y] = matriz[y][x];
            }
        }

        for(i = 0; i < transposta.length; i++) {
            var match = transposta[i].join('').match(/(X{3}|O{3})/);
            if(match) return match[0][0];
        }
    };

    diagonaisIguais = function() {
        if(matriz[0][0] === matriz[1][1] && matriz[1][1] === matriz[2][2]) return matriz[0][0];
        if(matriz[0][2] === matriz[1][1] && matriz[1][1] === matriz[2][0]) return matriz[0][2];
    };

    todosPreenchidos = function() {
        for(x = 0; x < 3; x++) {
            for(y = 0; y < 3; y++) {
                if(!matriz[x][y]) return false;
            }
        }
        return true;
    };

    return new o();
};
