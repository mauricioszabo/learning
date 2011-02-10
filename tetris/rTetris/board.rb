require 'piece.rb'

class Board
  attr_accessor :tabuleiro, :peca, :next
	
  def nova_peca
    @next = Piece.new
  end

  def proximo
    @peca = @next
    nova_peca
  end
  
  def esquerda
    @peca.x -= 1
    @peca.x += 1 if colide?
  end
  
  def direita
    @peca.x += 1
    @peca.x -= 1 if colide?
  end
  
  def baixo
    if @mr
      @peca.y += 1
    else
      @peca.y += 0.1
    end
    		
    colidiu = colide?
		
    if colidiu or @peca.y + @peca.matriz.length > 21
      @peca.y = 21 - self.peca.matriz.length if @peca.y + @peca.matriz.length > 21
      fixar
    end
  end
	
  def mais_rapido(baixo)
    @mr = baixo
  end
	
  def colide?
    selfy = @peca.y.to_i
		
    @peca.matriz[0].length.times do |x|
      @peca.matriz.length.times do |y|
        begin
	  next if x+@peca.x < 0 or y + selfy < 0
	  if @peca.matriz[y][x] == 1 and @tabuleiro[y+selfy][x+@peca.x] == 1
  	    return true
	  end
	rescue
	end
      end
    end
    return false
  end
	
  #Trava a peça no tabuleiro
  def fixar
    @peca.y = @peca.y.to_i - 1
    for x in @peca.x...@peca.matriz[0].length + @peca.x
      for y in @peca.y...@peca.matriz.length + self.peca.y.to_i
        if x < 0 or y < 0
          fail "Game Over"
        elsif @peca.matriz[y-@peca.y.to_i][x-@peca.x] == 1
          @tabuleiro[y][x] = 1
        end
      end
    end
      	
    limpa
    proximo
  end
		
  #Rotaciona a peça.
  def rotacionar
    colunas = @peca.matriz[0].length
      	
    #Acertar as linhas e colunas:
    antx = self.peca.x

    @peca.x += colunas / 2 - @peca.matriz.length / 2
    if colide? or @peca.x + @peca.matriz.length > 10 or @peca.x < 0
      @peca.x = antx
      return
    end

    @peca.matriz = @peca.matriz.transpose.reverse
  end

  def limpa
    20.times do |y|
      if @tabuleiro[y] == [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]:
        @tabuleiro.delete_at y
        @tabuleiro = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]] + @tabuleiro
      end
    end
  end

  def initialize
    @mr = false
    @tabuleiro = []
    20.times do |y|
      @tabuleiro += [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
    end

    nova_peca
    proximo
  end
end

