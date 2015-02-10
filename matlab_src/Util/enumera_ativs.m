function [ out ] = enumera_ativs( dados )

x= [];

out=zeros(1,9); %9 diferente atividades?

for i=1:length(dados)
    curr_ativ = dados(i).Atividade;
    if ( (curr_ativ > 0) & (curr_ativ < 9) )
        out(curr_ativ) = out(curr_ativ) + dados(i).Janelas.NJanelas; % accumulate
    end
end
