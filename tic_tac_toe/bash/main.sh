source tabuleiro.sh

jogar() {
    while(jogo_acabou; [ $? == 0 ]); do
        imprimir_tabuleiro
        processar_jogada
    done

    imprimir_tabuleiro
    echo -e "\n\n$(mensagem_final)"
}

processar_jogada() {
    read jogada
    tamanho=`expr match $jogada [ABC][123]`
    if [ "$tamanho" == 0 ]; then
        echo "Erro na jogada: jogada deve ser A1, A2, B2, etc."
        return
    fi

    x=$((`printf "%d" "'${jogada:0:1}"` - 65))
    y=$((${jogada:1:1} - 1))
    preencher_tabuleiro $x $y
    if [ $? == 0 ]; then
        echo "Quadrado já está preenchido!"
    fi
}

jogar
