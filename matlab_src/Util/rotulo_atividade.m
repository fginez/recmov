function [rotulo] = rotulo_atividade ( a )
    switch( a )
        case 0
            rotulo = 'Ignorar';        
        case 1
            rotulo = 'Deitado';
        case 2
            rotulo = 'Sentado';            
        case 3
            rotulo = 'Em pé';            
        case 4
            rotulo = 'Andando';
        case 5
            rotulo = 'Correndo';
        case 6
            rotulo = 'Subindo escada';
        case 7
            rotulo = 'Descendo escada';                        
        case 8
            rotulo = 'No computador'; 
        case 9
            rotulo = 'Sem classificação';                                    
        otherwise
            rotulo = 'Erro de execução';
    end
    