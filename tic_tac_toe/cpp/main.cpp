#include "tabuleiro.h"
#include "main.h"

#include <iostream>
using namespace std;

int main(void) {
    Main main;
    main.jogar();
    return 0;
}

Main::Main() {
    tabuleiro = new Tabuleiro();
}

Main::~Main() {
    delete tabuleiro;
}

void Main::jogar() {
    while(!tabuleiro->jogo_acabou()) {
        tabuleiro->imprimir();
        processar_jogada();
    }

    tabuleiro->imprimir();
    cout << "\n\n" << tabuleiro->mensagem_final() << "\n";
}

void Main::processar_jogada() {
    string jogada;
    cin >> jogada;
    if(jogada_invalida(jogada)) {
        printf("Erro na jogada: jogada deve ser A1, A2, B2, etc.\n");
        return;
    }
    
    int x = jogada[0] - 'A';
    int y = jogada[1] - '1';
    if(!tabuleiro->preencher(x, y)) {
        printf("Quadrado já está preenchido!\n");
    }
}

bool Main::jogada_invalida(string jogada) {
    if(jogada[0] != 'A' && jogada[0] != 'B' && jogada[0] != 'C') return true;
    if(jogada[1] != '1' && jogada[1] != '2' && jogada[1] != '3') return true;
    return false;
}
