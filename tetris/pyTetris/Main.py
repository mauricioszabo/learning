#!/usr/bin/env python
# -*- coding: utf-8 -*-

import pygame
from Board import Board

class Principal:
    def __init__(self):
        pygame.init()
        self.screen = pygame.display.set_mode([806,604])
        self.tabuleiro = pygame.image.load("Tabuleiro.png")
        self.peca = pygame.image.load("Bloco.png")
        self.peca2 = pygame.image.load("Bloco2.png")
        "Coloca o desenho do tabuleiro na tela:"
        self.screen.blit(self.tabuleiro, [0,0,0,0])
        "Cria um tabuleiro:"
        self.board = Board()
        
        done = False
        while not done:
            ticks = pygame.time.get_ticks()
            for event in pygame.event.get():
                if event.type == pygame.QUIT: 
                    done = True
                if event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_LEFT:
                        self.board.esquerda()
                    elif event.key == pygame.K_RIGHT:
                        self.board.direita()
                    elif event.key == pygame.K_DOWN:
                        self.board.mais_rapido = True
                    elif event.key == pygame.K_UP:
                        self.board.rotacionar()
                    elif event.key == pygame.K_q:
                        done = True
                if event.type == pygame.KEYUP:
                    if event.key == pygame.K_DOWN:
                        self.board.mais_rapido = False
                        
            self.desenhar()
            tempo = pygame.time.get_ticks() - ticks;
            pygame.time.delay(60 - tempo)
            
    def desenhar(self):
        self.screen.blit(self.tabuleiro, [258,0,0,0], [258, 0, 299, 604])
        self.screen.blit(self.tabuleiro, [605,85,0,0], [605, 86, 120, 120])
        
        "Desenha o tabuleiro"
        for x in range(10):
            for y in range(20):
                if self.board.tabuleiro[y][x] == 1:
                    self.screen.blit(self.peca2, [x*30+258,y*30+3])
        
        "Desenha peça caindo"
        pecay = int(self.board.peca.y)
        for y in range(len(self.board.peca.matriz)):
            for x in range(len(self.board.peca.matriz[0])):
                if self.board.peca.matriz[y][x] == 1:
                    self.screen.blit(self.peca, [(x+self.board.peca.x)*30+258,(y+pecay)*30+3])
        
        "Desenha a próxima peça"
        for y in range(len(self.board.next.matriz)):
            for x in range(len(self.board.next.matriz[0])):
                if self.board.next.matriz[y][x] == 1:
                    self.screen.blit(self.peca, [(x+2-len(self.board.next.matriz[0])/2)*30+605, y*30+85])
        
        self.board.baixo()
        pygame.display.flip()
       
Principal()
