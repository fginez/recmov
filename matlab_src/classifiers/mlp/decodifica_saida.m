function target = decodifica_saida(entrada)

target = [];

for ( i=1:length(entrada) )
    [y, target_] = max(entrada(:,i));
    target = [target; target_];
end

