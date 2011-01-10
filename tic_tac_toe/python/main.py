#encoding: utf8
from tabuleiro import Tabuleiro
import sys
import re

class Main:
    def __init__(self):
        self.tabuleiro = Tabuleiro()

    def jogar(self):
        while(not self.tabuleiro.jogo_acabou()):
            self.tabuleiro.imprimir()
            self.processar_jogada()

        self.tabuleiro.imprimir()
        print
        print
        print self.tabuleiro.mensagem_final()

    def processar_jogada(self):
        jogada = sys.stdin.readline()
        regex = re.search("^([ABC])([123])$", jogada)
        if(not regex): return self.erro_jogada()
        x = bytearray(regex.group(1))[0] - 65
        y = int(regex.group(2)) - 1
        if(not self.tabuleiro.preencher(x, y)):
            print "Quadrado já está preenchido!"

    def erro_jogada(self):
        print "Erro na jogada: jogada deve ser A1, A2, B2, etc."

m = Main()
m.jogar()
