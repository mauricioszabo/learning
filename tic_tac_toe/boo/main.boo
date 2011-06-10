import Tabuleiro from "tabuleiro"
import System.Text


class MainClass():
    private Tabuleiro = Tabuleiro()
    
    def jogar():
        while(not Tabuleiro.JogoAcabou()):
            Tabuleiro.Imprimir()
            ProcessarJogada()

        Tabuleiro.Imprimir()
        print
        print
        print Tabuleiro.MensagemFinal()

    def ProcessarJogada():
        jogada = System.Console.ReadLine()
        re = /^([ABC])([123])$/.Match(jogada)
        if(not re.Success): 
        	ErroJogada()
        	return
        ascii = Encoding.ASCII
        x = ascii.GetBytes(re.Groups[1].ToString())[0] - 65
        y = int.Parse(re.Groups[2].ToString()) - 1
       	if(not Tabuleiro.Preencher(x, y)):
            print "Quadrado já está preenchido!"

    def ErroJogada():
        print "Erro na jogada: jogada deve ser A1, A2, B2, etc."

m = MainClass()
m.jogar()
