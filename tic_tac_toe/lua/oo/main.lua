require("tabuleiro")

Main = {
    tabuleiro = Tabuleiro
}

function Main:jogar()
    while not self.tabuleiro:jogo_acabou() do
        self.tabuleiro:imprimir()
        self:processar_jogada()
    end
    self.tabuleiro:imprimir()
    print()
    print()
    print(self.tabuleiro:mensagem_final())
end

function Main:processar_jogada()
    local jogada=io.read()
    x, y = jogada:match("([ABC])([123])")
    if(not x) then return self:erro_jogada() end
    x = x:byte() - 64
    y = y - 0
    if not self.tabuleiro:preencher(x, y) then
        print("Quadrado já está preenchido!")
    end
end

function Main:erro_jogada()
    print("Erro na jogada: jogada deve ser A1, A2, B2, etc.")
end

Main:jogar()
