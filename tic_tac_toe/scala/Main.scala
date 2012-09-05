import java.io._

object Main extends App {
    val tabuleiro = new Tabuleiro()
    val stdin = new BufferedReader(new InputStreamReader(System.in))
    jogar()

    def jogar() {
        while(!tabuleiro.jogoAcabou()) {
            tabuleiro imprimir()
            processarJogada()
        }
        tabuleiro imprimir()
        println("\n\n")
        println(tabuleiro.mensagemFinal())
    }

    def processarJogada() {
        val jogada = stdin.readLine()
        val regex = "^([ABC])([123])$".r
        jogada match {
            case regex(g1, g2) => {
                val x = g1(0) - 'A'
                val y = g2.toInt - 1
                if(!tabuleiro.preencher(x, y)) println("Quadrado já está preenchido!")
            }
            case _ => println("Erro na jogada: jogada deve ser A1, A2, B2, etc.")
        }
    }
}
