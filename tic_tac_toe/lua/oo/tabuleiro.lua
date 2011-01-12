local mensagem_final

Tabuleiro = {
    '     A   B   C ',
    '  1    |   |   ',
    '    ---+---+---',
    '  2    |   |   ',
    '    ---+---+---',
    '  3    |   |   ',
    jogador = 'X',
    matriz = { { false, false, false}, { false, false, false}, { false, false, false } }
}

function Tabuleiro:imprimir()
    for i, v in ipairs(self) do print(v) end
    io.write("\nJogador " .. self.jogador .. ", sua jogada? ")
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
    return self:mensagem_final()
end

function Tabuleiro:mensagem_final()
    if not mensagem_final then
        h = self:horizontais_ou_verticais_iguais()
        h = h or self:diagonais_iguais()
        if h then
            mensagem_final = h .. " Venceu!"
        elseif self:todos_preenchidos() then
            mensagem_final = "Deu velha!"
        end
    end
    return mensagem_final
end

local iguais = function(matriz)
    elemento = matriz[1]
    for i = 2, 3, 1 do
        if elemento ~= matriz[i] then return nil end
    end
    return elemento
end

local transpose = function(matriz)
    transposta = { {}, {}, {} }
    for x = 1, #matriz, 1 do
        for y = 1, #matriz[x], 1 do
            transposta[y][x] = matriz[x][y]
        end
    end
    return transposta
end

function Tabuleiro:horizontais_ou_verticais_iguais()
    for k, m in ipairs(self.matriz) do
        local elemento = iguais(m)
        if elemento then return elemento end
    end

    matriz = transpose(self.matriz)
    for k, m in ipairs(matriz) do
        local elemento = iguais(m)
        if elemento then return elemento end
    end
    return nil
end

function Tabuleiro:diagonais_iguais()
    matriz = self.matriz
    if(matriz[1][1] == matriz[2][2] and matriz[2][2] == matriz[3][3]) then return matriz[1][1] end
    if(matriz[1][3] == matriz[2][2] and matriz[2][2] == matriz[3][1]) then return matriz[1][3] end
    return nil;
end

function Tabuleiro:todos_preenchidos()
    for k, m1 in ipairs(self.matriz) do
        for k2, e in ipairs(m1) do
            if(not e) then return false end
        end
    end
    return true
end
