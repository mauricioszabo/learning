# 
# piece.rb
# 
# Created on 13/09/2007, 22:12:43
# 
# To change this template, choose Tools | Templates
# and open the template in the editor.
 

class Piece
  attr_reader :x
  attr_accessor :y, :matriz

  def initialize
    valor = rand(10)
    case valor
      when 0, 1
        @matriz = [[1],[1],[1],[1]]
      when 2, 3
        @matriz = [[1,1],[1,1]]
      when 4
        @matriz = [[1,0],[1,0],[1,1]]
      when 5
        @matriz = [[1,0],[1,1],[0,1]]
      when 6
        @matriz = [[1,0],[1,1],[1,0]]
      when 7
        @matriz = [[0,1],[0,1],[1,1]]
      when 8
        @matriz = [[0,1],[1,1],[1,0]]
      when 9
        @matriz = [[0,1],[1,1],[0,1]]
    end

    @x = 5 - @matriz[0].length
    @y = -@matriz.length
  end

  def x=(valor)
    return if valor < 0 or valor + @matriz[0].length > 10
    @x = valor
  end
end

