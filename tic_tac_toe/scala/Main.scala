import java.io._

object Main extends Application {
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
        val regex = "^([ABC])([123])$".r.findAllIn(jogada)
        if(!regex.hasNext) {
            println("Erro na jogada: jogada deve ser A1, A2, B2, etc.")
            return
        }

        val x = regex.group(1)(0) - 'A'
        val y = regex.group(2).toInt - 1
        if(!tabuleiro.preencher(x, y)) {
            println("Quadrado já está preenchido!")
        }
    }
}
