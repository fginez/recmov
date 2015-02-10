function [saida] = formata_dados(dados)
i = 0;

saida = [];

for ( i=1:length(dados) )
    NumJanelas = dados(i).Janelas.NJanelas;
	for ( j=1:NumJanelas )
        s = struct('x', dados(i).Janelas.Dados.x(:,j), ...		%Amostras brutas do eixo x (array)
			   'y', dados(i).Janelas.Dados.y(:,j), ...		%Amostras brutas do eixo y (array)
			   'z', dados(i).Janelas.Dados.z(:,j), ...		%Amostras brutas do eixo z (array)
			   'N', dados(i).Janelas.N, ...			%Tamanho da janela
			   'NomeAtiv', dados(i).NomeAtiv, ...		%Nome da atividade (string)
			   'Atividade', dados(i).Atividade, ...	%ID da atividade   (numero)
			   'Caracteristicas', [], ...			%Caracteristicas extra�das (array)
			   'Preclasse', [], ...					%Pr� classifica��o
			   'Classe', [] );						%Classifica��o
		saida = [ saida s ];
	end;
end
