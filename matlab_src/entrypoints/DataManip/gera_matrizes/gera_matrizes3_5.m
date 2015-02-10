function [input, target, input_n] = gera_matrizes3_5(Dados)

input =[];
target=[];
input_n=[];

for ( i=1:length(Dados) )
    
    input_ = [Dados(i).Caracteristicas(1) ...       % sma
              Dados(i).Caracteristicas(2) ...       % media x
              Dados(i).Caracteristicas(3) ...       % media y
              Dados(i).Caracteristicas(4) ...       % media z
              Dados(i).Caracteristicas(5) ...       % dp x
              Dados(i).Caracteristicas(6) ...       % dp y
              Dados(i).Caracteristicas(7) ...       % dp z
              Dados(i).Caracteristicas(15) ...       % obliquidad
              Dados(i).Caracteristicas(16) ...       % curtose
              Dados(i).Caracteristicas(17) ...      % svm
              Dados(i).Caracteristicas(18) ...      % em
              Dados(i).Caracteristicas(19) ...      % entropia x
              Dados(i).Caracteristicas(20) ...      % entropia y
              Dados(i).Caracteristicas(21) ...      % entropia               
              Dados(i).Caracteristicas(22) ...      % entropia 
              Dados(i).Caracteristicas(23) ...      % entropia 
              Dados(i).Caracteristicas(24) ...      % entropia 
              Dados(i).Caracteristicas(31) ...      % seq s mov x
              Dados(i).Caracteristicas(32) ...      % seq s mov y
              Dados(i).Caracteristicas(33) ...      % seq s mov z                    
              ];  
    
    target_ = (-1)*ones(1,4);
    
    % converte a saida de 8 atividades para 4 (Estaticas)
    if ( Dados(i).Atividade == 8 )
        target_(4) = 1;
    else
        target_(Dados(i).Atividade) = 1;
    end
    
    input  = [input ; input_ ];
    target = [target; target_];
    
end;

[m n] = size(input);

input_n = input;

% normaliza as caracteristicas
for j=1:n
   input_n(:,j) = normaliza_caracteristica( input(:,j) );
end

input  = input';
target = target';
input_n = input_n';
