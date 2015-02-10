function [ fp p ] = calc_freqanalise( x )

	comp = length(x);
	fp = 0;
    p  = 0;
	
	%calcula a soma dos modulos
    [f X] = calc_fft(x, 33, 128);
    
    X_m = 0; 
    
%	for i=1:comp/2+1
	for i=5:comp/2+1
		X_m = X_m + 2*abs(X(i))*log10(2*abs(X(i)));	        
	end
	
	%normaliza pelo tamanho da janela
	e = -X_m;