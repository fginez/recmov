% Testa diferentes limiares para o pre-classificador

erros = [];

for limiar1=0:100
       D=preclass(D, limiar1);
       e=erros_preclass(D);
       erros = [ erros  sum(e) ];
end

plot(erros);