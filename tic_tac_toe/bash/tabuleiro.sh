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
        if [ $h ]; then
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
}

iguais() {
    x=$1
    elemento=${matriz[$x0]}
    for y in {1..2}; do
        if [ "${matriz[$x$y]}" != "$elemento" ]; then 
            echo ""
            return 0
        fi
    done
    echo $elemento
}
