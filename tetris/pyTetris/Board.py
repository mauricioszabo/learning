# -*- coding: utf-8 -*-

import random
import time
from Piece import Piece

class Board:
    tabuleiro = []
    mais_rapido = False
    
    def nova_peca(self):
        self.next = Piece()
    
    def proximo(self):
        self.peca = self.next
        self.nova_peca()
    
    def esquerda(self):
        if self.peca.x == 0: return
        self.peca.x -= 1
        if(self.colide()): self.peca.x += 1
    
    def direita(self):
        if self.peca.x + len(self.peca.matriz[0]) == 10: return
        self.peca.x += 1
        if(self.colide()): self.peca.x -= 1
    
    def baixo(self):
        if self.mais_rapido: self.peca.y += 1
        else: self.peca.y += 0.1
        
        colidiu = self.colide()
        if colidiu or self.peca.y + len(self.peca.matriz) > 21:
            if self.peca.y + len(self.peca.matriz) > 21: self.peca.y = 21 - len(self.peca.matriz) 
            self.fixar()
    
    def colide(self):
        selfy = int(self.peca.y)
    
        for x in range(len(self.peca.matriz[0])):
            for y in range(len(self.peca.matriz)):
                try:
                    if x+self.peca.x < 0 or y+int(selfy) < 0: continue
                    if self.peca.matriz[y][x] == 1 and self.tabuleiro[y+int(selfy)][x+self.peca.x] == 1:
                        return True
                except:
                    pass
        return False
    
    def fixar(self):
        "Trava a peça no tabuleiro"
        self.peca.y = int(self.peca.y)  - 1
        for x in range(self.peca.x, len(self.peca.matriz[0]) + self.peca.x):
            for y in range(int(self.peca.y), len(self.peca.matriz) + int(self.peca.y)):
                if x < 0 or y < 0:
                    raise Exception("Game Over")
                if self.peca.matriz[y-int(self.peca.y)][x-self.peca.x] == 1:
                    self.tabuleiro[y][x] = 1
        
        self.limpar()
        self.proximo()
        
    def rotacionar(self):
        "Rotaciona a peça."
        colunas = len(self.peca.matriz[0])
        
        "Acertar as linhas e colunas:"
        antx = self.peca.x
        
        self.peca.x += colunas / 2 - len(self.peca.matriz) / 2
        if self.colide() or self.peca.x + len(self.peca.matriz) > 10 or self.peca.x < 0:
            self.peca.x = antx
            return
        
        self.peca.matriz = zip(*self.peca.matriz)
        self.peca.matriz.reverse()
    
    def limpar(self):
        for y in range(0, 20):
            if self.tabuleiro[y] == [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]:
                del(self.tabuleiro[y])
                self.tabuleiro.insert(0, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0])
    
    
    def __init__(self):
        random.seed = time.time()
        for y in range(20):
            self.tabuleiro.append( [0, 0, 0, 0, 0, 0, 0, 0, 0, 0] )
        
        self.nova_peca()
        self.proximo()
