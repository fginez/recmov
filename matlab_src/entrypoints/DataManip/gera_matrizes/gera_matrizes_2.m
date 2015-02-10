function [input, target, input_n] = gera_matrizes_2(Dados)

input =[];
target=[];
input_n=[];

for ( i=1:length(Dados) )

    input_ = [Dados(i).Caracteristicas(1) ...       % sma
              Dados(i).Caracteristicas(2) ...       % media x
              Dados(i).Caracteristicas(3) ...       % media y
              Dados(i).Caracteristicas(4) ...       % media z
              Dados(i).Caracteristicas(8) ...       % dp x
              Dados(i).Caracteristicas(9) ...       % dp y
              Dados(i).Caracteristicas(10) ...       % dp z
              Dados(i).Caracteristicas(15) ...       % obliquidad
              Dados(i).Caracteristicas(16) ...       % curtose
              Dados(i).Caracteristicas(17) ...      % svm
              Dados(i).Caracteristicas(18) ...      % em
              Dados(i).Caracteristicas(22) ...      % entropia x
              Dados(i).Caracteristicas(23) ...      % entropia y
              Dados(i).Caracteristicas(24) ...      % entropia z              
              ];       % entropia_z
    
    target_ = (-1)*ones(1,8);
    if ( (Dados(i).Atividade > 0) && (Dados(i).Atividade < 9) )
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
