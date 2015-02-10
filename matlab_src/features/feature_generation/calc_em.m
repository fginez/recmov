function [ em ] = calc_em( x, y, z, w)

	comp = length(x);
	em = 0;
	
	%calcula a soma dos modulos
    [f X] = calc_fft(x, 33, 128);
    [f Y] = calc_fft(y, 33, 128);
    [f Z] = calc_fft(z, 33, 128);
    
    X_m = 0;
    Y_m = 0;
    Z_m = 0;    
    
%	for i=1:comp/2+1
	for i=3:comp/2+1
		X_m = X_m + 2*abs(X(i))^2;	
		Y_m = Y_m + 2*abs(Y(i))^2;
		Z_m = Z_m + 2*abs(Z(i))^2;        
	end
	
	%normaliza pelo tamanho da janela
	em = (X_m + Y_m + Z_m)/3;
