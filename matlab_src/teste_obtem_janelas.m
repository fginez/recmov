tamanho_janela = 4;
sobreposicao   = 2;

sinal = 1:8;
amostras_janeladas = [];

amostras_janeladas =  obtem_janelas(sinal', tamanho_janela, sobreposicao);

amostras_janelas';
