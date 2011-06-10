class Tabuleiro:
    private TABULEIRO = """
           A   B   C
        1    |   |  
          ---+---+---
        2    |   |  
          ---+---+---
        3    |   |   
    """
    private Tabuleiro = TABULEIRO.Split(char('\n'))
    private Jogador = "X"
    private Matriz = [ [null, null, null], [null, null, null], [null, null, null] ]
    private mensagemFinal = ""
    
    def Imprimir():
        for t in Tabuleiro:
            print t
        System.Console.Write("Jogador " + Jogador + ", sua Escolha? ")

    def Preencher(x as int, y as int):
        if(Matriz[x][y]): return false
        Matriz[x][y] = Jogador
        y = y * 2 + 2
        x = x * 4 + 11
        bytes = Tabuleiro[y].ToCharArray()
        bytes[x] = Jogador.ToCharArray()[0]
        Tabuleiro[y] = string(bytes)
        if(Jogador == 'X'):
            Jogador = "O"
        else:
            Jogador = "X"
        return true

    def JogoAcabou():
        return MensagemFinal() != ''

    def MensagemFinal():
        if(mensagemFinal == ''):
            h = HorizontaisOuVerticaisIguais()
            #h = h or diagonais_iguais()
            if(h):
                self.__mensagem_final = "{0} Venceu!".format(h)
            #elif(self.todos_preenchidos()):
            #    self.__mensagem_final = 'Deu velha!'
        return mensagemFinal

    def HorizontaisOuVerticaisIguais():
        for i in range(3):
            if(not all(Matriz[i])): continue
            elementos = list(set(self.matriz[i]))
            if(len(elementos) == 1):
                return elementos[0]
      
#        matriz = zip(*self.matriz)
#        for i in range(3):
#            if(not all(matriz[i])): next
#            elementos = list(set(matriz[i]))
#            if(len(elementos) == 1):
#                return elementos[0]
#        return None
#
#    def diagonais_iguais(self):
#        matriz = self.matriz
#        if(matriz[0][0] == matriz[1][1] == matriz[2][2]): return matriz[0][0]
#        if(matriz[0][2] == matriz[1][1] == matriz[2][0]): return matriz[0][2]
#
#    def todos_preenchidos(self):
#        for m1 in self.matriz:
#            for e in m1:
#                if(not e): return False
#        return True;
