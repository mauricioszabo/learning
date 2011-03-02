use strict;
use warnings;
use tabuleiro;

sub jogar {
    my $tabuleiro = shift;

    while(!tabuleiro::jogo_acabou($tabuleiro)) {
        tabuleiro::imprimir_tabuleiro($tabuleiro);
        processar_jogada($tabuleiro);
    }

    tabuleiro::imprimir_tabuleiro($tabuleiro);
    print "\n\n" . tabuleiro::mensagem_final($tabuleiro). "\n";
}

sub processar_jogada {
    my $tabuleiro = shift;
    <> =~ /^([ABC])([123])$/;
    defined($1) or return erro_jogada();
    #return erro_jogada() if !defined($1);
    my $x = ord($1) - 65;
    my $y = $2 - 1;
    if(!tabuleiro::preencher($tabuleiro, $x, $y)) {
        print "Quadrado já está preenchido!\n";
    }
}

sub erro_jogada {
    print "Erro na jogada: jogada deve ser A1, A2, B2, etc.\n";
}

my %tabuleiro = (
    'tabuleiro' => [
        "     A   B   C ",
        "  1    |   |   ",
        "    ---+---+---",
        "  2    |   |   ",
        "    ---+---+---",
        "  3    |   |   "
    ],
    'jogador' => 'X',
    'matriz' => [ ['', '', ''],['', '', ''],['', '', '']],
    'mensagem_final' => ''
);

jogar(\%tabuleiro);
