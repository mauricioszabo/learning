#encoding: utf8
from tabuleiro import Tabuleiro
import sys

class Main:
    def __init__(self):
        self.tabuleiro = Tabuleiro()

    def jogar(self):
        while(not self.tabuleiro.jogo_acabou()):
            self.tabuleiro.imprimir()
            self.processar_jogada()

        self.tabuleiro.imprimir(O)
        print
        print
        print self.tabuleiro.mensagem_final()

    def processar_jogada(self):
        jogada = sys.stdin.readline()

    #def processar_jogada(self)
    #  x, y = gets.scan(/^([ABC])([123])$/)[0]
    #  return erro_jogada if x.nil?
    #  x = x.each_byte.first - 65
    #  y = y.to_i - 1
    #  unless @tabuleiro.preencher(x, y)
    #    puts "Quadrado já está preenchido!"
    #  end
    #end

    #def erro_jogada
    #  puts "Erro na jogada: jogada deve ser A1, A2, B2, etc."
    #end

m = Main()
m.jogar()
