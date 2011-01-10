#include "tabuleiro.h"
#include "main.h"
#include <stdio.h>

#define TRUE 1
#define FALSE 0

int main(void) {
    Tabuleiro tabuleiro;
    iniciar_tabuleiro(&tabuleiro);
    jogar(&tabuleiro);
    return 0;
}

void jogar(Tabuleiro *tabuleiro) {
    while(!jogo_acabou(tabuleiro)) {
        imprimir_tabuleiro(tabuleiro);
        processar_jogada(tabuleiro);
    }

    imprimir_tabuleiro(tabuleiro);
    printf("\n\n%s\n", mensagem_final(tabuleiro));
}

void processar_jogada(Tabuleiro *tabuleiro) {
    char jogada[3];
    int x, y;

    scanf("%s", jogada);
    if(jogada_invalida(jogada)) {
        printf("Erro na jogada: jogada deve ser A1, A2, B2, etc.\n");
        return;
    }
    x = jogada[0] - 'A';
    y = jogada[1] - '1';
    if(!preencher_tabuleiro(tabuleiro, x, y)) {
        printf("Quadrado já está preenchido!\n");
    }
}

int jogada_invalida(const char *jogada) {
    if(jogada[0] != 'A' && jogada[0] != 'B' && jogada[0] != 'C') return TRUE;
    if(jogada[1] != '1' && jogada[1] != '2' && jogada[1] != '3') return TRUE;
    return FALSE;
}
