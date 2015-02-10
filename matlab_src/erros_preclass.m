function [erros] = erros_preclass(janelas)

a = zeros(8,1);

for ( i=1:length(janelas) )
    ativ = janelas(i).Atividade;
    if ( (ativ == 1) || (ativ == 2) || (ativ == 3) || (ativ == 8 ))
        if ( janelas(i).Preclasse == 1 )            
            switch(ativ)
                case 1
                    a(1) = a(1) + 1;
                case 2
                    a(2) = a(2) + 1;                    
                case 3
                    a(3) = a(3) + 1;
                case 8
                    a(8) = a(8) + 1;                    
            end
        end
    else
        if ( janelas(i).Preclasse == 0 )
            switch(ativ)
                case 4
                    a(4) = a(4) + 1;
                case 5
                    a(5) = a(5) + 1;                    
                case 6
                    a(6) = a(6) + 1;
                case 7
                    a(7) = a(7) + 1;                    
            end
        end;
    end;
    
    erros = a;
    
end;