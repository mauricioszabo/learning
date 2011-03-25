class Tabuleiro {
    private String mMensagemFinal = "";
    private String[][] matriz = { { null, null, null}, { null, null, null}, { null, null, null} };
    private String[] tabuleiro = {
        "     A   B   C ",
        "  1    |   |   ",
        "    ---+---+---",
        "  2    |   |   ",
        "    ---+---+---",
        "  3    |   |   "
    };
    private char jogador = 'X';

    public void imprimir() {
        for(String t : tabuleiro) {
            System.out.println(t);
        }

        System.out.print("\n Jogador " + jogador + ", sua escolha? ");
    }

    //TODO: Deve ter uma forma melhor de fazer esse balaio...
    public boolean preencher(int x, int y) {
        if(matriz[x][y] != null) return false;
        char[] a = { jogador };
        matriz[x][y] = new String(a);
        y = y * 2 + 1;
        x = x * 4 + 5;
        
        char []tab = tabuleiro[y].toCharArray();
        tab[x] = jogador;
        tabuleiro[y] = new String(tab);
        jogador = jogador == 'X' ? 'O' : 'X';
        return true;
    }
    
    public boolean jogoAcabou() {
        return !mensagemFinal().equals("");
    }

    public String mensagemFinal() {
        if(mMensagemFinal.equals("")) {
            String h;
            h = horizontaisOuVerticaisIguais();
            if(h == null) h = diagonaisIguais();
            if(h != null) {
                mMensagemFinal = h + " Venceu!";
            } else if(todosPreenchidos()) {
                mMensagemFinal = "Deu velha!";
            }
        }
        return mMensagemFinal;
    }

    private String horizontaisOuVerticaisIguais() {
        String elemento;
        for(int i = 0; i < matriz.length; i++) {
            elemento = iguais(matriz[i]);
            if(elemento != null) return elemento;
        }
        
        String [][]transposta = transpose(matriz);
        for(int i = 0; i < transposta.length; i++) {
            elemento = iguais(transposta[i]);
            if(elemento != null) return elemento;
        }
        return null;
    }

    private String iguais(String[] matriz) {
        String elemento = matriz[0];
        if(elemento == null) return null;
        for(int i = 1; i < matriz.length; i++) {
            if(!elemento.equals(matriz[i])) return null;
        }
        return elemento;
    }

    private String[][] transpose(String[][] original) {
        String[][] transposta = new String[3][3];
        for(int x = 0; x < matriz.length; x++) {
            for(int y = 0; y < matriz[x].length; y++) {
                transposta[y][x] = original[x][y];
            }
        }
        return transposta;
    }

    private String diagonaisIguais() {
        try {
            if(matriz[0][0].equals(matriz[1][1]) && matriz[1][1].equals(matriz[2][2])) return matriz[0][0];
            if(matriz[0][2].equals(matriz[1][1]) && matriz[1][1].equals(matriz[2][0])) return matriz[0][2];
        } catch(NullPointerException e) {
        }
        return null;
    }

    private boolean todosPreenchidos() {
        for(int x = 0; x < matriz.length; x++) {
            for(int y = 0; y < matriz.length; y++) {
                if(matriz[x][y] == null) return false;
            }
        }
        return true;
    }
}
