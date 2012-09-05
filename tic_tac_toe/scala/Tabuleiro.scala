import scala.collection.mutable.MutableList

class Tabuleiro {
    val TABULEIRO = """
       A   B   C 
    1    |   |   
      ---+---+---
    2    |   |   
      ---+---+---
    3    |   |   
    """
    val tabuleiro = TABULEIRO.split("\n")
    
    val matriz = MutableList[MutableList[String]](
        MutableList(null,null,null), MutableList(null,null,null), MutableList(null,null,null)
    )
    var jogador = "X"
    var m_mensagemFinal = ""

    def imprimir() {
        tabuleiro foreach println
        print("Jogador " + jogador + ", sua escolha? ")
    }

    def preencher(x:Int, y:Int): Boolean = {
        if(matriz(x)(y) != null) return false
        matriz(x)(y) = jogador
        val y1 = y * 2 + 2;
        val x1 = x * 4 + 7;
        val s = tabuleiro(y1)
        tabuleiro(y1) = s.take(x1) + jogador + s.drop(x1 + 1)
        jogador = if(jogador == "X") "O" else "X"
        return true
    }

    def jogoAcabou(): Boolean =  mensagemFinal() != ""

    def mensagemFinal(): String = {
        if(m_mensagemFinal == "") {
            var h = horizontaisOuVerticaisIguais
            if(h == null) h = diagonaisIguais
            if(h != null) {
                m_mensagemFinal = h + " Venceu!"
            } else if(todosPreenchidos) {
                m_mensagemFinal = "Deu velha!"
            }
        }
        return m_mensagemFinal
    }

    private def horizontaisOuVerticaisIguais: String = {
        val comp = (m: MutableList[String]) => {
            if(!m.exists(e => e == null)) {
                val elementos = m.distinct
                if(elementos.size == 1) return elementos.head
            }
        }
        matriz foreach(comp)
        matriz.transpose foreach(comp)
        return null
    }

    private def diagonaisIguais:String = {
        if(matriz(0)(0) == matriz(1)(1) && matriz(1)(1) == matriz(2)(2)) return matriz(0)(0);
        if(matriz(0)(2) == matriz(1)(1) && matriz(1)(1) == matriz(2)(0)) return matriz(0)(2);
        return null;
    }

    private def todosPreenchidos = !matriz.exists(e => e.exists( e2 => e2 == null ) )
}
