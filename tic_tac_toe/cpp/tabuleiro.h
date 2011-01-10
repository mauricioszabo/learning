#ifndef TABULEIRO_H
#define TABULEIRO_H

#include <vector>
#include <string>

using namespace std;
#define GradeVelha vector< vector <string> >

class Tabuleiro {
    public:
    Tabuleiro();
    void imprimir();
    bool preencher(int x, int y);
    bool jogo_acabou();
    string mensagem_final();

    private:
    string horizontais_ou_verticais_iguais();
    string iguais(vector<string> matriz);
    GradeVelha transpose(GradeVelha original);
    string diagonais_iguais();
    bool todos_preenchidos();

    vector<string> tabuleiro;
    char jogador;
    GradeVelha matriz;
    string m_mensagem_final;
};

#endif
