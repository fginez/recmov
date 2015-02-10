function [out] = remove_atividades(dados)
% remove_atividades
% Remove as atividades '0' e '9' que devem ser desconsideradas para a 
% formação da base de dados

    out = [];
    
    %Numero de elementos na estrutura
    numDados = length(dados);
    
    numNovosDados = 0;
    
    %Analisa cada elemento da estrutura "dados"
    for ( i = 1:numDados )
       
        %Verifica se é uma atividade ignorada
        if ( (dados(i).Atividade==0) || (dados(i).Atividade==9) )
            continue;
        end
        
        %Verifica se contem mais de 1 janela
        if ( dados(i).Janelas.NJanelas <= 1 )
            continue;
        end
        
        % append to output vector
        out = [out dados(i)];
    end
end
