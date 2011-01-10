require 'tabuleiro'

class Main
  def initialize
    @tabuleiro = Tabuleiro.new
  end

  def jogar
    while !@tabuleiro.jogo_acabou?
      @tabuleiro.imprimir
      processar_jogada
    end

    @tabuleiro.imprimir
    puts
    puts
    puts @tabuleiro.mensagem_final
  end

  def processar_jogada
    x, y = gets.scan(/^([ABC])([123])$/)[0]
    return erro_jogada if x.nil?
    x = x.each_byte.first - 65
    y = y.to_i - 1
    unless @tabuleiro.preencher(x, y)
      puts "Quadrado já está preenchido!"
    end
  end

  def erro_jogada
    puts "Erro na jogada: jogada deve ser A1, A2, B2, etc."
  end
end

Main.new.jogar if $0 == __FILE__
