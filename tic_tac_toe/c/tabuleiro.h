#ifndef TABULEIRO_H
#define TABULEIRO_H

#define NULL 0
#define TRUE 1
#define FALSE 0

typedef struct TabuleiroStruct {
    char tabuleiro[6][20];
    char jogador;
    char matriz[3][3];
    char mensagem_final[200];
} Tabuleiro;

void iniciar_tabuleiro(Tabuleiro *tabuleiro);
void imprimir_tabuleiro(Tabuleiro *tabuleiro);
int preencher_tabuleiro(Tabuleiro *tabuleiro, int x, int y);
int jogo_acabou(Tabuleiro *tabuleiro);
const char *mensagem_final(Tabuleiro *tabuleiro);
char horizontais_ou_verticais_iguais(Tabuleiro *tabuleiro);
char iguais(const char *matriz);
void transpose(char original[3][3], char transposta[3][3]);
char diagonais_iguais(Tabuleiro *t);
int todos_preenchidos(Tabuleiro *t);
#endif
