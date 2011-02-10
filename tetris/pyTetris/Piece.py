import pygame
import random
import time

class Piece:
    def __init__(self):
        valor = int(random.random() * 10)
        if(valor == 0 or valor == 5):
            self.matriz = [[1],[1],[1],[1]]
        elif(valor == 1 or valor == 6):
            self.matriz = [[1,1],[1,1]]
        elif(valor == 2):
            self.matriz = [[1,0],[1,0],[1,1]]
        elif(valor == 3):
            self.matriz = [[1,0],[1,1],[0,1]]
        elif(valor == 4):
            self.matriz = [[1,0],[1,1],[1,0]]
        elif(valor == 7):
            self.matriz = [[0,1],[0,1],[1,1]]
        elif(valor == 8):
            self.matriz = [[0,1],[1,1],[1,0]]
        else:
            self.matriz = [[0,1],[1,1],[0,1]]
        
        #Posicionar a matriz:
        self.x = 5 - len(self.matriz[0]) / 2
        self.y = -len(self.matriz)
