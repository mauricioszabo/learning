class Tabuleiro
  TABULEIRO = '
     A   B   C
  1    |   |  
    ---+---+---
  2    |   |  
    ---+---+---
  3    |   |   
  '

  def initialize
    @tabuleiro = TABULEIRO.split "\n"
    @jogador = 'X'
    @matriz = Array.new(3) { |x| Array.new(3) }
  end

  def imprimir
    puts @tabuleiro
    print "Jogador #@jogador, sua Escolha? "
  end

  def preencher(x, y)
    return false if @matriz[x][y]
    @matriz[x][y] = @jogador
    y = y * 2 + 2
    x = x * 4 + 5
    @tabuleiro[y][x] = @jogador
    @jogador = @jogador == 'X' ? "O": "X"
  end

  def jogo_acabou?
    mensagem_final
  end

  def mensagem_final
    @mensagem ||= proc do
      h = horizontais_ou_verticais_iguais
      h ||= diagonais_iguais
      if h
        "#{h} Venceu!"
      end
    end.call
  end

  def horizontais_ou_verticais_iguais
    3.times do |i|
      next unless @matriz[i].all?
      elementos = @matriz[i].uniq
      return elementos.first if elementos.size == 1
    end
    matriz = @matriz.transpose
    3.times do |i|
      next unless matriz[i].all?
      elementos = matriz[i].uniq
      return elementos.first if elementos.size == 1
    end
    return nil
  end

  def diagonais_iguais
    return @matriz[0][0] if @matriz[0][0] == @matriz[1][1] && @matriz[1][1] == @matriz[2][2]
    return @matriz[0][2] if @matriz[0][2] == @matriz[1][1] && @matriz[1][1] == @matriz[2][0]
  end
end
