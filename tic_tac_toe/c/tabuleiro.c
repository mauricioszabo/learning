#include "tabuleiro.h"
#include <string.h>
#include <stdio.h>

void iniciar_tabuleiro(Tabuleiro *tabuleiro) {
    int x, y;
    strcpy(tabuleiro->tabuleiro[0], "     A   B   C ");
    strcpy(tabuleiro->tabuleiro[1], "  1    |   |   ");
    strcpy(tabuleiro->tabuleiro[2], "    ---+---+---");
    strcpy(tabuleiro->tabuleiro[3], "  2    |   |   ");
    strcpy(tabuleiro->tabuleiro[4], "    ---+---+---");
    strcpy(tabuleiro->tabuleiro[5], "  3    |   |   ");
    tabuleiro->jogador = 'X';

    for(x = 0; x < 3; x++) {
        for(y = 0; y < 3; y++) {
            tabuleiro->matriz[x][y] = '\0';
        }
    }
    strcpy(tabuleiro->mensagem_final, "");
}

void imprimir_tabuleiro(Tabuleiro *tabuleiro) {
    int c;
    printf("\n");
    for(c = 0; c < 6; c++) {
        printf("%s\n", tabuleiro->tabuleiro[c]);
    }
    printf("\nJogador %c, sua escolha? ", tabuleiro->jogador);
}

int preencher_tabuleiro(Tabuleiro *tabuleiro, int x, int y) {
    if(tabuleiro->matriz[x][y]) return FALSE;
    tabuleiro->matriz[x][y] = tabuleiro->jogador;
    y = y * 2 + 1;
    x = x * 4 + 5;
    tabuleiro->tabuleiro[y][x] = tabuleiro->jogador;
    tabuleiro->jogador = tabuleiro->jogador == 'X' ? 'O' : 'X';
    return TRUE;
}

int jogo_acabou(Tabuleiro *tabuleiro) {
    return strcmp(mensagem_final(tabuleiro), "") != 0;
}

const char *mensagem_final(Tabuleiro *tabuleiro) {
    char h;
    if(strcmp(tabuleiro->mensagem_final, "") == 0) {
        h = horizontais_ou_verticais_iguais(tabuleiro);
        if(!h) h = diagonais_iguais(tabuleiro);
        if(h) {
            strcpy(tabuleiro->mensagem_final, "? Venceu!");
            tabuleiro->mensagem_final[0] = h;
        } else if(todos_preenchidos(tabuleiro)) {
            strcpy(tabuleiro->mensagem_final, "Deu velha!");
        }
    }
    return tabuleiro->mensagem_final;
}

char horizontais_ou_verticais_iguais(Tabuleiro *tabuleiro) {
    int i;
    char elemento;
    char transposta[3][3];
    for(i = 0; i < 3; i++) {
        elemento = iguais(tabuleiro->matriz[i]);
        if(elemento) return elemento;
    }
    transpose(tabuleiro->matriz, transposta);
    for(i = 0; i < 3; i++) {
        elemento = iguais(transposta[i]);
        if(elemento) return elemento;
    }
    return '\0';
}

char iguais(const char *matriz) {
    int i;
    char elemento = matriz[0];
    for(i = 1; i < 3; i++) {
        if(elemento != matriz[i]) return '\0';
    }
    return elemento;
}

void transpose(char original[3][3], char transposta[3][3]) {
    int x, y;
    for(x = 0; x < 3; x++) {
        for(y = 0; y < 3; y++) {
            transposta[y][x] = original[x][y];
        }
    }
}

char diagonais_iguais(Tabuleiro *t) {
    if(t->matriz[0][0] == t->matriz[1][1] && t->matriz[1][1] == t->matriz[2][2]) return t->matriz[0][0];
    if(t->matriz[0][2] == t->matriz[1][1] && t->matriz[1][1] == t->matriz[2][0]) return t->matriz[0][2];
    return '\0';
}

int todos_preenchidos(Tabuleiro *tabuleiro) {
    int x, y;
    for(x = 0; x < 3; x++) {
        for(y = 0; y < 3; y++) {
            if(!tabuleiro->matriz[x][y]) return FALSE;
        }
    }
    return TRUE;
}
