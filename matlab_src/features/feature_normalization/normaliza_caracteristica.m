function [resultado] = normaliza_caracteristica(dados)

% quantidade de elementos
l = length(dados);

resultado = [];

% calcula a média e desvio padrão
m = mean(dados);
dp = std(dados);

for i=1:l
   %normaliza
   res = (dados(i) - m) / dp;
   
   % coloca no vetor de saída
    resultado = [resultado; res];
end
