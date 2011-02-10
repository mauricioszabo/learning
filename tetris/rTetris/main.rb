#!/usr/bin/env ruby

require "rubygems"
require 'sdl'
require 'board.rb'

class Principal
  def initialize
    SDL.init SDL::INIT_VIDEO
    @screen = SDL.set_video_mode 806, 604, 0, 0
    @tabuleiro = SDL::Surface.load "Tabuleiro.png"
    @peca = SDL::Surface.load "Bloco.png"
    @peca2 = SDL::Surface.load "Bloco2.png"
    #Coloca o desenho do tabuleiro na tela:
    SDL.blit_surface @tabuleiro, 0, 0, 0, 0, @screen, 0, 0
    #Cria um tabuleiro:
    @board = Board.new

    done = false
    while not done
      ticks = SDL.get_ticks
      while event = SDL::Event2.poll
        case event
          when SDL::Event2::Quit
            done = true
          when SDL::Event2::KeyDown
            case event.sym
              when SDL::Key::LEFT
                @board.esquerda
              when SDL::Key::RIGHT
                @board.direita
              when SDL::Key::DOWN
                @board.mais_rapido true
              when SDL::Key::UP
                @board.rotacionar
              when SDL::Key::Q
                done = true
            end
          when SDL::Event2::KeyUp
            @board.mais_rapido(false) if event.sym == SDL::Key::DOWN
        end
      end

      desenha
      tempo = SDL.get_ticks - ticks
      SDL.delay 60 - tempo if tempo < 60
    end

    SDL.quit
  end

  def desenha
    SDL.blit_surface @tabuleiro, 258, 0, 299, 604, @screen, 258, 0
    SDL.blit_surface @tabuleiro, 605, 86, 120, 120, @screen, 605,85

    #Desenha o tabuleiro
    10.times do |x|
      20.times do |y|
        SDL.blit_surface @peca2, 0,0,0,0, @screen, x*30+258,y*30+3 if @board.tabuleiro[y][x] == 1
      end
    end

    #Desenha peça caindo
    pecay = @board.peca.y.to_i
    @board.peca.matriz.length.times do |y|
      @board.peca.matriz[0].length.times do |x|
        if @board.peca.matriz[y][x] == 1
          SDL.blit_surface @peca, 0,0,0,0, @screen, (x+@board.peca.x)*30+258,(y+pecay)*30+3
        end
      end
    end

    #Desenha a próxima peça
    @board.next.matriz.length.times do |y|
      @board.next.matriz[0].length.times do |x|
        if @board.next.matriz[y][x] == 1
          SDL.blit_surface @peca, 0,0,0,0, @screen, (x+2-@board.next.matriz[0].length / 2)*30+605, y*30+85
        end
      end
    end

    @board.baixo
    @screen.flip
  end
end

Principal.new if $0 == __FILE__
