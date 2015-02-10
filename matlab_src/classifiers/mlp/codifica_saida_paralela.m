function target = codifica_saida_paralela(entrada)

target = [];

for ( i=1:length(entrada) )
    target_ = (-1)*ones(1,4);
    if ( (entrada(i) > 0) && (entrada(i) < 9) )
        target_(entrada(i) ) = 1;
    end
    target = [target; target_];
end

