function [ input, input_norm, target, preclass ] = gen_rawmatrix(Dados)
% gen_rawmatrix
% Inputs:
% @Dados - Estrutura de dados
%
% Outputs:
% @input
% @input_norm
% @target
% @preclass
%
input =[];
target=[];
input_norm=[];

%% Feature extraction
for ( i=1:length(Dados) )

    input_ = [Dados(i).Caracteristicas(1) ...       % sma
              Dados(i).Caracteristicas(2) ...       % media x
              Dados(i).Caracteristicas(3) ...       % media y
              Dados(i).Caracteristicas(4) ...       % media z
              Dados(i).Caracteristicas(5) ...       % dp x
              Dados(i).Caracteristicas(6) ...       % dp y
              Dados(i).Caracteristicas(7) ...       % dp z
              Dados(i).Caracteristicas(8) ...       % dp z
              Dados(i).Caracteristicas(9) ...       % dp z
              Dados(i).Caracteristicas(10) ...       % dp z              
              Dados(i).Caracteristicas(11) ...       % dp z
              Dados(i).Caracteristicas(12) ...       % dp z
              Dados(i).Caracteristicas(13) ...       % dp z
              Dados(i).Caracteristicas(14) ...       % dp z              
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
              Dados(i).Caracteristicas(25) ...       % dp z
              Dados(i).Caracteristicas(26) ...       % dp z
              Dados(i).Caracteristicas(27) ...       % dp z
              Dados(i).Caracteristicas(28) ...       % dp z              
              Dados(i).Caracteristicas(29) ...       % dp z
              Dados(i).Caracteristicas(30) ...       % dp z              
              Dados(i).Caracteristicas(31) ...      % seq s mov x
              Dados(i).Caracteristicas(32) ...      % seq s mov y
              Dados(i).Caracteristicas(33) ...      % seq s mov z               
              ];       
    
    % deprecated: Used to encode targets to output code.
    %target_ = (-1)*ones(1,8);
    %if ( (Dados(i).Atividade > 0) && (Dados(i).Atividade < 9) )
    %    target_(Dados(i).Atividade) = 1;
    %end
    target_=Dados(i).Atividade;
    
    input  = [input ; input_ ];
    target = [target; target_];
    
end;

[m n] = size(input);

input_norm = input;
% normaliza as caracteristicas
for j=1:n
   input_norm(:,j) = normaliza_caracteristica( input(:,j) );
end;

% pre-classificacao (hard) em função da atividade informada pelo supervisor
preclass = zeros(m,1);
for j=1:m
    ativ = Dados(j).Atividade;
    if ( (ativ == 1) || (ativ == 2) || (ativ == 3) || (ativ == 8 ))
        preclass_ = 0;
    else
        preclass_ = 1;        
    end
    preclass(j) = preclass_ ;
end;

end
