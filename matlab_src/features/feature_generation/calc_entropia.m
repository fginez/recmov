function [ e ] = calc_entropia( x )

	comp = length(x);
	e = 0;
	
	%calcula a soma dos modulos
    [f X] = calc_fft(x, 33, 128);
    
    P = 2.*(abs(X)).^2;
    
    X_m = 0; 
    
%	for i=1:comp/2+1
	for i=3:comp/2+1
        if ( P(i) > 0 )
            res = (P(i)*log10(P(i)));
            X_m = X_m + res;
        end
	end
	
	%normaliza pelo tamanho da janela
	e = -X_m;
    