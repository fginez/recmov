function target = codifica_saida(entrada)

target = [];

for ( i=1:length(entrada) )
    target_ = (-1)*ones(1,8);
    if ( (entrada(i) > 0) && (entrada(i) < 9) )
        target_(entrada(i) ) = 1;
    end
    target = [target; target_];
end

