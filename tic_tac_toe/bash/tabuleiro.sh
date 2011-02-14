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
    [ ${matriz[$x$y]} ] && return 0
    matriz[$x$y]=$jogador
    y=$(($y * 2 + 1))
    x=$(($x * 4 + 5))
    t=${tabuleiro[$y]}
    tabuleiro[$y]="${t:0:$x}$jogador${t:$((x+1))}"
    [ $jogador == "X" ] && jogador="Y" || jogador="X"
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
        [ "$h" == "" ] && h=$(diagonais_iguais)
        if [ "$h" != "" ]; then 
            m_mensagem_final="$h Venceu!"
        else
            todos_preenchidos
            if [ $? == 1 ]; then
                m_mensagem_final="Deu velha!"
            fi
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
    [ ! ${matriz[11]} ] && return
    [ "${matriz[00]}" == "${matriz[11]}" ] && [ "${matriz[22]}" == "${matriz[11]}" ] && echo "${matriz[00]}"
    [ "${matriz[02]}" == "${matriz[11]}" ] && [ "${matriz[20]}" == "${matriz[11]}" ] && echo "${matriz[02]}"
}

todos_preenchidos() {
    for x in {0..2}; do
        for y in {0..2}; do
            [ ! ${matriz[$x$y]} ] && return 0
        done
    done
}

