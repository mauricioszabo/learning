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

    var horizontais_ou_verticais_iguais = function() {
        var elemento, i;
        var iguais = function(matriz) {
            var elemento = matriz[0];
            var i;
            for(i = 2; i < 3; i++) {
                if(elemento !== matriz[i]) return false;
            }
            return elemento;
        }

        for(i = 0; i < 3; i++) {
            elemento = iguais(matriz[i]);
            if(elemento) return elemento;
        }
        return false
    }


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
            jogador = jogador == 'X' ? 'O' : 'X';
            return true;
        },

        jogo_acabou: function() {
            return tabuleiro.mensagem_final();
        },

        mensagem_final: function() {
            var h;

            if(!mensagem_final) {
                h = horizontais_ou_verticais_iguais();
                alert(h);
            }
            return mensagem_final;
        }
    };

    return tabuleiro;
}
