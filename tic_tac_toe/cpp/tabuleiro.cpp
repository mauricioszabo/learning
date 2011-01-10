#include "tabuleiro.h"
#include <iostream>
using namespace std;

Tabuleiro::Tabuleiro() {
    tabuleiro.push_back("     A   B   C ");
    tabuleiro.push_back("  1    |   |   ");
    tabuleiro.push_back("    ---+---+---");
    tabuleiro.push_back("  2    |   |   ");
    tabuleiro.push_back("    ---+---+---");
    tabuleiro.push_back("  3    |   |   ");
    jogador = 'X';

    vector <string> m;
    for(int i = 0; i < 3; i++) m.push_back("");
    for(int i = 0; i < 3; i++) matriz.push_back(m);
    m_mensagem_final = "";
}

void Tabuleiro::imprimir() {
    cout << endl;
    for(int c = 0; c < 6; c++) {
        cout << tabuleiro[c] << endl;
    }
    cout << "\nJogador " << jogador << ", sua escolha? ";
}

bool Tabuleiro::preencher(int x, int y) {
    if(matriz[x][y] != "") return false;
    matriz[x][y] = jogador;
    y = y * 2 + 1;
    x = x * 4 + 5;
    tabuleiro[y][x] = jogador;
    jogador = jogador == 'X' ? 'O' : 'X';
    return true;
}

bool Tabuleiro::jogo_acabou() {
    return mensagem_final() != "";
}

string Tabuleiro::mensagem_final() {
    if(m_mensagem_final == "") {
        string h;
        h = horizontais_ou_verticais_iguais();
        if(h == "") h = diagonais_iguais();
        if(h != "") {
            m_mensagem_final = h + " Venceu!";
        } else if(todos_preenchidos()) {
            m_mensagem_final = "Deu velha!";
        }
    }
    return m_mensagem_final;
}

string Tabuleiro::horizontais_ou_verticais_iguais() {
    string elemento;
    for(int i = 0; i < 3; i++) {
        elemento = iguais(matriz[i]);
        if(elemento != "") return elemento;
    }
    
    GradeVelha transposta = transpose(matriz);
    for(int i = 0; i < 3; i++) {
        elemento = iguais(transposta[i]);
        if(elemento != "") return elemento;
    }
    return "";
}

string Tabuleiro::iguais(vector<string> matriz) {
    string elemento = matriz[0];
    for(int i = 1; i < 3; i++) {
        if(elemento != matriz[i]) return "";
    }
    return elemento;
}

GradeVelha Tabuleiro::transpose(GradeVelha original) {
    GradeVelha transposta;
    vector <string> m;
    for(int i = 0; i < 3; i++) m.push_back("");
    for(int i = 0; i < 3; i++) transposta.push_back(m);

    for(int x = 0; x < 3; x++) {
        for(int y = 0; y < 3; y++) {
            transposta[y][x] = original[x][y];
        }
    }
    return transposta;
}

string Tabuleiro::diagonais_iguais() {
    if(matriz[0][0] == matriz[1][1] && matriz[1][1] == matriz[2][2]) return matriz[0][0];
    if(matriz[0][2] == matriz[1][1] && matriz[1][1] == matriz[2][0]) return matriz[0][2];
    return "";
}

bool Tabuleiro::todos_preenchidos() {
    for(int x = 0; x < 3; x++) {
        for(int y = 0; y < 3; y++) {
            if(matriz[x][y] == "") return false;
        }
    }
    return true;
}
