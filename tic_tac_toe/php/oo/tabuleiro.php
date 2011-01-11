<?
  class Tabuleiro {
    private $tabuleiro = array(
      '     A   B   C ',
      '  1    |   |   ',
      '    ---+---+---',
      '  2    |   |   ',
      '    ---+---+---',
      '  3    |   |   '
    );
    private $jogador = 'X';
    private $matriz = array( array(false, false, false), array(false, false, false), array(false, false, false));

    public function imprimir() {
      foreach($this->tabuleiro as $t) {
        print "$t\n";
      }
      print "\nJogador $this->jogador, sua escolha? ";
    }

    public function preencher($x, $y) {
      if($this->matriz[$x][$y]) return false;
      $this->matriz[$x][$y] = $this->jogador;
      $y = $y * 2 + 1;
      $x = $x * 4 + 5;

      $this->tabuleiro[$y][$x] = $this->jogador;
      $this->jogador = $this->jogador == 'X' ? "O": "X";
      return true;
    }

    public function jogo_acabou() {
      return $this->mensagem_final();
    }

    public function mensagem_final() {
      if(!$this->m_mensagem_final) {
        $h = $this->horizontais_ou_verticais_iguais();
        if(!$h) $h = $this->diagonais_iguais();
        if($h) {
          $this->m_mensagem_final = "$h Venceu!";
        } elseif($this->todos_preenchidos()) {
          $this->m_mensagem_final = "Deu velha!";
        }
      }
      return $this->m_mensagem_final;
    }

    private function horizontais_ou_verticais_iguais() {
      foreach($this->matriz as $m) {
        $elemento = $this->iguais($m);
        if($elemento) return $elemento;
      }
      $matriz = $this->transpose($this->matriz);
      foreach($matriz as $m) {
        $elemento = $this->iguais($m);
        if($elemento) return $elemento;
      }
      return false; 
    }

    private function iguais($matriz) {
      $elemento = $matriz[0];
      for($i = 1; $i < count($matriz); $i++) {
        if($elemento != $matriz[$i]) return false;
      }
      return $elemento;
    }

    private function diagonais_iguais() {
      $matriz = $this->matriz;
      if($matriz[0][0] == $matriz[1][1] && $matriz[1][1] == $matriz[2][2]) return $matriz[0][0];
      if($matriz[0][2] == $matriz[1][1] && $matriz[1][1] == $matriz[2][0]) return $matriz[0][2];
    }

    private function transpose($original) {
      for($x = 0; $x < count($original); $x++) {
        for($y = 0; $y < count($original[$x]); $y++) {
          $transposta[$y][$x] = $original[$x][$y];
        }
      }
      return $transposta;
    }

    private function todos_preenchidos() {
      foreach($this->matriz as $m1) {
        foreach($m1 as $elemento) {
          if(!$elemento) return false;
        }
      }
      return true;
    }
  }
?>
