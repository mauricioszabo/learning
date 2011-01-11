
function get(id) {
    return document.getElementById(id);
}

window.onload = function() {
    main = {
        tabuleiro: criarTabuleiro(),

        jogar: function() {
            if(!main.tabuleiro.jogo_acabou()) {
                get('output').innerHTML = '';
                main.processar_jogada();
                main.exibir();
            } else {
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
            if(!main.tabuleiro.preencher(x, y)) {
                get('output').innerHTML += "Quadrado já está preenchido!\n";
            }
        },
        
        exibir: function() {
            var retorno = main.tabuleiro.imprimir();
            get('output').innerHTML += retorno;
        }
    };

    get('form').onsubmit = main.jogar;
    main.exibir();
};
