#ifndef MAIN_H
#define MAIN_H

class Main {
    public:
    Main();
    ~Main();

    void jogar();
    void processar_jogada();
    bool jogada_invalida(string jogada);

    private:
    Tabuleiro *tabuleiro;
};
#endif
