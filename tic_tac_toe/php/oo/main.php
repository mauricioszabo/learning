<?
  require_once('tabuleiro.php');

  class Main {
    private $tabuleiro;

    public function jogar() {
      $this->tabuleiro = new Tabuleiro();
      while(!$this->tabuleiro->jogo_acabou()) {
        $this->tabuleiro->imprimir();
        $this->processar_jogada();
      }

      $this->tabuleiro->imprimir();
      print "\n\n";
      print $this->tabuleiro->mensagem_final();
      print "\n";
    }

    public function processar_jogada() {
      $handle = fopen ("php://stdin","r");
      $jogada = fgets($handle);
      preg_match("/^([ABC])([123])$/", $jogada, $grupo);
      if(count($grupo) == 0) {
        print "Erro na jogada: jogada deve ser A1, A2, B2, etc.\n";
        return;
      }
      
      $x = ord($grupo[1]) - 65;
      $y = (int) $grupo[2] - 1;
      if(!$this->tabuleiro->preencher($x, $y)) {
        print "Quadrado já está preenchido!\n";
      }
    }
  }

  $main = new Main();
  $main->jogar();
?>
