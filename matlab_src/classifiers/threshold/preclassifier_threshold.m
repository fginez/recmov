function [ class ] = preclassifier_threshold( input )
%PRECLASSIFIER_THRESHOLD Summary of this function goes here
%   Detailed explanation goes here

    limiar1 = 10;
    limiar2 = 11; 

	% calcula o SMA
	sma  = input(1);
	em   = input(15);
    smovn = input(33);

	% aplica o limiar de classificacao
	if ( (sma > limiar1) && ( em > limiar2 ) && ( smovn < 35 ) )
		class = 1;
    else
		class = 0;
	end;
    
end

