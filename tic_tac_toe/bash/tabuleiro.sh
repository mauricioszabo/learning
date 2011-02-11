tabuleiro[0]="     A   B   C "
tabuleiro[1]="  1    |   |   "
tabuleiro[2]="    ---+---+---"
tabuleiro[3]="  2    |   |   "
tabuleiro[4]="    ---+---+---"
tabuleiro[5]="  3    |   |   "
jogador=X

imprimir_tabuleiro() {
    echo
    for i in {0..5}; do
        echo "${tabuleiro[$i]}"
    done
    echo -ne "\nJogador $jogador, sua escolha? "
}

preencher_tabuleiro() {
    x=$1
    y=$2
    if [ ${matriz[$x$y]} ]; then return 0; fi
    matriz[$x$y]=$jogador
    y=$(($y * 2 + 1))
    x=$(($x * 4 + 5))
    t=${tabuleiro[$y]}
    tabuleiro[$y]="${t:0:$x}$jogador${t:$((x+1))}"
    if [ $jogador == "X" ]; then jogador="Y"; else jogador="X"; fi
    return 1
}

jogo_acabou() {
    if [ "$(mensagem_final)" == "" ]; then
        return 0
    else
        return 1
    fi
}

mensagem_final() {
    if [ ! $m_mensagem_final ]; then
        h=$(horizontais_ou_verticais_iguais)
        if [ "$h" == "" ]; then h=$(diagonais_iguais); fi
        if [ "$h" != "" ]; then 
            m_mensagem_final="$h Venceu!"
        fi
    fi

    echo "$m_mensagem_final"
}

horizontais_ou_verticais_iguais() {
    for i in {0..2}; do
        elemento=$(iguais $i) 
        if [ "$elemento" != "" ]; then 
            echo $elemento
            return
        fi
    done

    for i in {0..2}; do
        elemento=$(iguais $i 1) 
        if [ "$elemento" != "" ]; then
            echo $elemento
            return
        fi
    done
}

iguais() {
    x=$1
    reverse=$2
    elemento=${matriz[$x0]}
    for y in {1..2}; do
        if [ $reverse ]; then
            var=${matriz[$y$x]}
        else
            var=${matriz[$x$y]}
        fi

        if [ "$var" != "$elemento" ]; then 
            echo ""
            return
        fi
    done
    echo $elemento
}

diagonais_iguais() {
    if [ ! ${matriz[11]} ]; then return; fi
    [ "${matriz[00]}" == "${matriz[11]}" ] && [ "${matriz[22]}" == "${matriz[11]}" ] && echo "${matriz[00]}"
    [ "${matriz[02]}" == "${matriz[11]}" ] && [ "${matriz[20]}" == "${matriz[11]}" ] && echo "${matriz[02]}"
}

#int todos_preenchidos(Tabuleiro *tabuleiro) {
#    int x, y;
#    for(x = 0; x < 3; x++) {
#        for(y = 0; y < 3; y++) {
#            if(!tabuleiro->matriz[x][y]) return FALSE;
#        }
#    }
#    return TRUE;
#}

