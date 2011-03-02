use strict;
use warnings;

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
    return 0 if $tabuleiro->{matriz}[$x][$y];
    $tabuleiro->{matriz}[$x][$y] = $tabuleiro->{jogador};
    $y = $y * 2 + 1;
    $x = $x * 4 + 4;

    $tabuleiro->{tabuleiro}[$y] = substr($tabuleiro->{tabuleiro}[$y], 0, $x+1) . $tabuleiro->{jogador} . substr($tabuleiro->{tabuleiro}[$y], $x+2);
    $tabuleiro->{jogador} =~ tr/XO/OX/;
    return 1;
}

sub jogo_acabou {
    my $tabuleiro = shift;
    return mensagem_final($tabuleiro) ne '';
}

sub mensagem_final {
    my $tabuleiro = shift;
    return $tabuleiro->{mensagem_final} unless $tabuleiro->{mensagem_final} eq '';
    my $h = horizontais_ou_verticais_iguais($tabuleiro);
    $h ||= diagonais_iguais($tabuleiro);
    if($h) {
        $tabuleiro->{mensagem_final} = "$h Venceu!";
    } elsif(todos_preenchidos($tabuleiro)) {
        $tabuleiro->{mensagem_final} = "Deu velha!";
    }

    return $tabuleiro->{mensagem_final};
}

sub horizontais_ou_verticais_iguais {
    my $tabuleiro = shift;

    foreach (@{$tabuleiro->{matriz}}) {
        join("", @{$_}) =~ /(X{3}|O{3})/;
        return substr($1, 0, 1) if $1;
    }

    my @transposta = transpose($tabuleiro->{matriz});
    foreach (@transposta) {
        join("", @{$_}) =~ /(X{3}|O{3})/;
        return substr($1, 0, 1) if $1;
    }
    return;
}

sub transpose {
    my $matriz = shift;
    my @matriz = @{$matriz};
    my @transposta;
    my $x;
    my $y;

    for $x (0..$#matriz) {
        for $y (0..$#{$matriz[$x]}) {
            $transposta[$y][$x] = $matriz[$x][$y];
        }
    }
    return @transposta;
}

sub diagonais_iguais {
    my $tabuleiro = shift;
    my @matriz = @{$tabuleiro->{matriz}};
    return $matriz[0][0] if $matriz[0][0] eq $matriz[1][1] && $matriz[1][1] eq $matriz[2][2];
    return $matriz[0][2] if $matriz[0][2] eq $matriz[1][1] && $matriz[1][1] eq $matriz[2][0];
}

sub todos_preenchidos {
    my $tabuleiro = shift;
    foreach (@{$tabuleiro->{matriz}}) {
        foreach (@{$_}) {
            return 0 if $_ eq '';
        }
    }
    return 1;
}
1;
