
function get(id) {
    return document.getElementById(id);
}

window.onload = function() {
    main = {
        tabuleiro: criarTabuleiro(),

        jogar: function() {
            get('output').innerHTML = '';
            this.processar_jogada();
            this.exibir();
            if(this.tabuleiro.jogo_acabou()) {
                get('output').innerHTML += "\n"
                get('output').innerHTML += "\n"
                get('output').innerHTML += this.tabuleiro.mensagem_final();
                get('form').onsubmit = function() {
                    alert("O jogo acabou!")
                    return false;
                };
            }
            return false;
        },

        processar_jogada: function() {
            var jogada = get('input').value;
            var x, y;

            get('input').value = '';
            jogada = jogada.match(/^([ABC])([123])$/);
            if(!jogada) {
                get('output').innerHTML += "Erro na jogada: jogada deve ser A1, A2, B2, etc.\n";
                return;
            }
            x = jogada[1].charCodeAt(0) - 65;
            y = jogada[2] - 1;
            if(!this.tabuleiro.preencher(x, y)) {
                get('output').innerHTML += "Quadrado já está preenchido!\n";
            }
        },
        
        exibir: function() {
            var retorno = this.tabuleiro.imprimir();
            get('output').innerHTML += retorno;
        }
    };

    
    get('form').onsubmit = function() {
        try {
            main.jogar();
        } catch(e) {
            alert(e);
        }
            return false;
    };
    main.exibir();
};
