function [ svm ] = calc_svm( x, y, z, w)

	comp = length(x);
	svm  = 0;
	
	%calcula a soma dos modulos
	for i=1:comp
		svm = svm + ( (x(i))^2 + (y(i))^2 + (z(i))^2 );	
	end
	
	%normaliza pelo tamanho da janela
	svm = sqrt(svm)/w;