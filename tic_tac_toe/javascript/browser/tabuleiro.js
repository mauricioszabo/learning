function criarTabuleiro() {
    var array = [
        '     A   B   C ',
        '  1    |   |   ',
        '    ---+---+---',
        '  2    |   |   ',
        '    ---+---+---',
        '  3    |   |   '
    ];
    var jogador = 'X';
    var matriz = [ [], [], [] ];
    var mensagem_final;

    var transpose = function(matriz) {
        var transposta = [ [], [], [] ];
        for(x = 0; x < 3; x++) {
            for(y = 0; y < 3; y++) {
                transposta[y][x] = matriz[x][y];
            }
        }
        return transposta;
    }

    var iguais = function(matriz) {
        var elemento = matriz[0];
        var i;
        for(i = 1; i < 3; i++) {
            if(elemento !== matriz[i]) return false;
        }
        return elemento;
    };

    var horizontais_ou_verticais_iguais = function() {
        var elemento, i;
        var transposta;
        for(i = 0; i < 3; i++) {
            elemento = iguais(matriz[i]);
            if(elemento) return elemento;
        }
        transposta = transpose(matriz);
        for(i = 0; i < 3; i++) {
            elemento = iguais(transposta[i]);
            if(elemento) return elemento;
        }
        return false;
    };

    var diagonais_iguais = function() {
        if(matriz[0][0] === matriz[1][1] && matriz[1][1] === matriz[2][2]) return matriz[0][0];
        if(matriz[0][2] === matriz[1][1] && matriz[1][1] === matriz[2][0]) return matriz[0][2];
        return null;
    };

    var todos_preenchidos = function() {
        var x, y;
        for(x = 0; x < 3; x++) {
            for(y = 0; y < 3; y++) {
                if(!matriz[x][y]) return false;
            }
        }
        return true;
    };

    var tabuleiro = {
        imprimir: function() {
            var retorno = array.join("\n");
            retorno += "\nJogador ";
            retorno += jogador + ", sua jogada? ";
            return retorno;
        },

        preencher: function(x, y) {
            if(matriz[x][y]) return false;
            matriz[x][y] = jogador;
            y = y * 2 + 1;
            x = x * 4 + 4;
            array[y] = array[y].slice(0, x+1) + jogador + array[y].slice(x+2);
            jogador = jogador === 'X' ? 'O' : 'X';
            return true;
        },

        jogo_acabou: function() {
            return this.mensagem_final();
        },

        mensagem_final: function() {
            var h;

            if(!mensagem_final) {
                h = horizontais_ou_verticais_iguais();
                h = h || diagonais_iguais();
                if(h) {
                    mensagem_final = h + " Venceu!";
                } else if(todos_preenchidos()) {
                    mensagem_final = "Deu velha!";
                }
            }
            return mensagem_final;
        }
    };

    return tabuleiro;
}
