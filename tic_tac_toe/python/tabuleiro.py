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
        self.__mensagem_final = ''

    def imprimir(self):
        for t in self.tabuleiro:
            print t
        sys.stdout.write("Jogador {0}, sua Escolha? ".format(self.jogador))

    def preencher(self, x, y):
        if(self.matriz[x][y]): return False
        self.matriz[x][y] = self.jogador
        y = y * 2 + 2
        x = x * 4 + 11
        bytes = bytearray(self.tabuleiro[y])
        bytes[x] = self.jogador
        self.tabuleiro[y] = str(bytes)
        if(self.jogador == 'X'):
            self.jogador = "O"
        else:
            self.jogador = "X"
        return True

    def jogo_acabou(self):
        return self.mensagem_final() != ''

    def mensagem_final(self):
        if(self.__mensagem_final == ''):
            h = self.horizontais_ou_verticais_iguais()
            h = h or self.diagonais_iguais()
            if(h):
                self.__mensagem_final = "{0} Venceu!".format(h)
            elif(self.todos_preenchidos()):
                self.__mensagem_final = 'Deu velha!'
        return self.__mensagem_final

    def horizontais_ou_verticais_iguais(self):
        for i in range(3):
            if(not all(self.matriz[i])): next
            elementos = list(set(self.matriz[i]))
            if(len(elementos) == 1):
                return elementos[0]
      
        matriz = zip(*self.matriz)
        for i in range(3):
            if(not all(matriz[i])): next
            elementos = list(set(matriz[i]))
            if(len(elementos) == 1):
                return elementos[0]
        return None

    def diagonais_iguais(self):
        matriz = self.matriz
        if(matriz[0][0] == matriz[1][1] == matriz[2][2]): return matriz[0][0]
        if(matriz[0][2] == matriz[1][1] == matriz[2][0]): return matriz[0][2]

    def todos_preenchidos(self):
        for m1 in self.matriz:
            for e in m1:
                if(not e): return False
        return True;
