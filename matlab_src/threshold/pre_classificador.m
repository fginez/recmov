function [classe] = pre_classificador ( janela )

	limiar1 = 10;
    limiar2 = 11; 

	% calcula o SMA
	sma  = janela.Caracteristicas(1);
	em   = janela.Caracteristicas(15);
    smovn = janela.Caracteristicas(37);

	% aplica o limiar de classificacao
	if ( (sma > limiar1) || ( em > limiar2 ) && ( smovn < 35 ) )
		classe = 1;
    else
		classe = 0;
	end;
