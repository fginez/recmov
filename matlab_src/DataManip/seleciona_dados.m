function [ sel ] = seleciona_dados(dados, selecao)

    sel = [];
    
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
        
        numNovosDados = numNovosDados+1;
        
        %Janelas a serem excluidas
        inicio = selecao(numNovosDados,1);
        fim    = selecao(numNovosDados,2);
        
        [Janelas_X num] = exclui_janelas( dados(i).Janelas.Dados.x, inicio, fim ); 
        [Janelas_Y num] = exclui_janelas( dados(i).Janelas.Dados.y, inicio, fim ); 
        [Janelas_Z num] = exclui_janelas( dados(i).Janelas.Dados.z, inicio, fim ); 
        
        s_Dados = struct('x', Janelas_X, 'y', Janelas_Y, 'z', Janelas_Z);
        
        s_Janelas = struct('N', dados(i).Janelas.N, 'Sobreposicao', dados(i).Janelas.Sobreposicao, 'NJanelas', num, 'Dados', s_Dados);
        
        s = struct('Atividade', dados(i).Atividade, 'NomeAtiv', dados(i).NomeAtiv, 'Janelas', s_Janelas);
        
        sel = [sel s];
        
    end
