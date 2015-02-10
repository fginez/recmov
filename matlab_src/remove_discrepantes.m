function [janelas_out] = remove_discrepantes(janelas)

janelas_out = [];

for ( i=1:length(janelas) )
    
    ativ = janelas(i).Atividade;
    
    if ( janelas(i).Preclasse == 1 ) % dinamica
        if ( (ativ == 4) || (ativ == 5) || (ativ == 6) || (ativ == 7 ))
            janelas_out = [ janelas_out janelas(i)];
        end
    else
         if ( (ativ == 1) || (ativ == 2) || (ativ == 3) || (ativ == 8 ))
            janelas_out = [ janelas_out janelas(i)];
         end        
    end    	
end
