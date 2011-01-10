#encoding: utf8
import sys

class Tabuleiro:
    def __init__(self):
        TABULEIRO = """
           A   B   C
        1    |   |  
          ---+---+---
        2    |   |  
          ---+---+---
        3    |   |   
        """

        self.tabuleiro = TABULEIRO.split("\n")
        self.jogador = 'X'
        self.matriz = [
            [None, None, None],
            [None, None, None],
            [None, None, None]
        ]

    def imprimir(self):
        print self.tabuleiro
        sys.stdout.write("Jogador %s, sua Escolha? " % self.jogador)

    def preencher(self, x, y):
        if(self.matriz[x][y]): return False
        self.matriz[x][y] = self.jogador
        y = y * 2 + 2
        x = x * 4 + 5
        self.tabuleiro[y][x] = self.jogador
        if(self.jogador == 'X'):
            self.jogador = "O"
        else:
            self.jogador = "X"

    def jogo_acabou(self):
        False

    #def jogo_acabou?
    #  mensagem_final
    #end

    #def mensagem_final
    #  @mensagem ||= proc do
    #    h = horizontais_ou_verticais_iguais
    #    h ||= diagonais_iguais
    #    if h
    #      "#{h} Venceu!"
    #    end
    #  end.call
    #end

    #def horizontais_ou_verticais_iguais
    #  3.times do |i|
    #    next unless @matriz[i].all?
    #    elementos = @matriz[i].uniq
    #    return elementos.first if elementos.size == 1
    #  end
    #  matriz = @matriz.transpose
    #  3.times do |i|
    #    next unless matriz[i].all?
    #    elementos = matriz[i].uniq
    #    return elementos.first if elementos.size == 1
    #  end
    #  return nil
    #end

    #def diagonais_iguais
    #  return @matriz[0][0] if @matriz[0][0] == @matriz[1][1] && @matriz[1][1] == @matriz[2][2]
    #  return @matriz[0][2] if @matriz[0][2] == @matriz[1][1] && @matriz[1][1] == @matriz[2][0]
    #end
