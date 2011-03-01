package tabuleiro;
sub imprimir_tabuleiro {
    my $tabuleiro = shift;

    print "\n" . join("\n", @{$tabuleiro->{tabuleiro}});
    print "\n\nJogador $tabuleiro->{jogador}, sua jogada? ";
}

sub preencher {
    my $tabuleiro = shift;
    my $x = shift;
    my $y = shift;
    print "Tabuleiro: " . $tabuleiro->{matriz}[$x][$y] . "\n";
    return 0 if $tabuleiro->{matriz}[$x][$y];
    $tabuleiro->{matriz}[$x][$y] = $tabuleiro->{jogador};
    $y = $y * 2 + 1;
    $x = $x * 4 + 4;

    $tabuleiro->{tabuleiro}[$y] = substr($tabuleiro->{tabuleiro}[$y], 0, $x+1) . $tabuleiro->{jogador} . substr($tabuleiro->{tabuleiro}[$y], $x+2);
    $tabuleiro->{jogador} =~ tr/XO/OX/;
    print $tabuleiro->{jogador};
    return 1;
}

sub jogo_acabou {
    my $tabuleiro = shift;
    return mensagem_final($tabuleiro) != '';
}

1;
