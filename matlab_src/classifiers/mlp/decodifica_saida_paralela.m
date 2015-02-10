function target = decodifica_saida_paralela(entrada)

target = [];

[m n] = size(entrada);

for ( i=1:n )
    [y, target_] = max(entrada(:,i));
    target = [target; target_];
end

