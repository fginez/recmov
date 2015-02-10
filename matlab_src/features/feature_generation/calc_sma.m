function [ sma ] = calc_sma( x, y, z, w)

	comp = length(x);
	sma  = 0;
	
	%calcula a soma dos modulos
	for i=1:comp
		sma = sma + ( abs(x(i)) + abs(y(i)) + abs(z(i)) );	
	end
	
	%normaliza pelo tamanho da janela
	sma = sma/w;
