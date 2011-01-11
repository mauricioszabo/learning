local mensagem_final

Tabuleiro = {
  '     A   B   C ',
  '  1    |   |   ',
  '    ---+---+---',
  '  2    |   |   ',
  '    ---+---+---',
  '  3    |   |   ',
  jogador = 'X',
  matriz = { { nil, nil, nil}, { nil, nil, nil}, { nil, nil, nil} }
}

function Tabuleiro:imprimir()
  for i, v in ipairs(self) do print(v) end
  print("\nJogador " .. self.jogador .. ", sua jogada? ")
end

function Tabuleiro:preencher(x, y)
  if self.matriz[x][y] then return false end
  self.matriz[x][y] = self.jogador
  y = y * 2
  x = x * 4
  self[y] = self[y]:sub(1, x+1) .. self.jogador .. self[y]:sub(x+3)
  if self.jogador == "X" then 
    self.jogador = "O"
  else 
    self.jogador = "X"
  end
  return true
end

function Tabuleiro:jogo_acabou()
  self:mensagem_final()
end

function Tabuleiro:mensagem_final()
  if not mensagem_final then
    h = self:horizontais_ou_verticais_iguais()
    print(h)
    --h ||= diagonais_iguais
    if h then
      mensagem_final = h .. " Venceu!"
    --elsif todos_preenchidos?
      --"Deu velha!"
    end
   
  end
  return mensagem_final
end

function Tabuleiro:horizontais_ou_verticais_iguais()
  local iguais = function(matriz)
    elemento = matriz[1]
    for i = 2, 3, 1 do
      if not elemento == matriz[i] then return nil end
    end
    return elemento
  end

  for k, m in ipairs(self.matriz) do
    print("Matriz")
    print(k)
    print(m[1])
    print(m[2])
    print(m[3])
    print()
    local elemento = iguais(m)
    print("WOW")
    print(elemento)
    if elemento then return elemento end
  end
  --matriz = @matriz.transpose
  --3.times do |i|
  --  next unless matriz[i].all?
  --  elementos = matriz[i].uniq
  --  return elementos.first if elementos.size == 1
  --end
  return nil
end
