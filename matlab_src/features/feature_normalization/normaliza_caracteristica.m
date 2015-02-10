function [resultado] = normaliza_caracteristica(dados)

% quantidade de elementos
l = length(dados);

resultado = [];

% calcula a m�dia e desvio padr�o
m = mean(dados);
dp = std(dados);

for i=1:l
   %normaliza
   res = (dados(i) - m) / dp;
   
   % coloca no vetor de sa�da
    resultado = [resultado; res];
end
