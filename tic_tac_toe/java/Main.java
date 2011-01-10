import java.io.*;

public class Main {
    private Tabuleiro tabuleiro;
    BufferedReader stdin = new BufferedReader(new InputStreamReader(System.in));

    public static void main (String [] args) {
        new Main().jogar();
    }

    public Main() {
        tabuleiro = new Tabuleiro();
    }

    public void jogar() {
        while(!tabuleiro.jogoAcabou()) {
            tabuleiro.imprimir();
            processarJogada();
        }

        tabuleiro.imprimir();
        System.out.println("\n\n" + tabuleiro.mensagemFinal());
    }

    void processarJogada() {
        String jogada = "";
        try {
            jogada = stdin.readLine();
        } catch(Exception e) {
            System.out.println(e);
        }
        if(jogadaInvalida(jogada)) {
            System.out.println("Erro na jogada: jogada deve ser A1, A2, B2, etc.");
            return;
        }

        int x = jogada.charAt(0) - 'A';
        int y = jogada.charAt(1) - '1';
        if(!tabuleiro.preencher(x, y)) {
            System.out.println("Quadrado já está preenchido!");
        }
    }

    boolean jogadaInvalida(String jogada) {
        if(jogada.charAt(0) != 'A' && jogada.charAt(0) != 'B' && jogada.charAt(0) != 'C') return true;
        if(jogada.charAt(1) != '1' && jogada.charAt(1) != '2' && jogada.charAt(1) != '3') return true;
        return false;
    }
}
