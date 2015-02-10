%TODO: revisar... talvez a sobreposicao crie uma janela a mais. Ver
%incremento do ponteiro no fim

function [ amostras_janeladas ] =  obtem_janelas(sinal, tamanho_janela, sobreposicao)
%   obtem_janelas   Segmenta o sinal fornecido em janelas com sobreposicao
% Entradas:
%   sinal  : strem de dados
%   tamanho: tamanho da janela (128, 256, 512....)
%   sobreposicao: quantidade de amostras superpostas
% Saida:
%   amostras_janeladas : matriz com as janelas
%

	% inicializacao das variaveis
	pos_inicio = 1;
	pos_fim = pos_inicio+tamanho_janela-1;
	tamanho_sinal = length(sinal);
	janela = [];
    amostras_janeladas = [];

    % verifica se o sinal completa uma janela
    if ( length(sinal) < pos_fim )
        pos_fim = length(sinal); 
    end
    
	% loop de segmentação dos dados
	while (pos_inicio < tamanho_sinal)
        
		% segmenta os dados
		janela = sinal(pos_inicio:pos_fim);

		% verifica se não completou o tamanho da janela
		if ( (pos_fim - pos_inicio + 1) < tamanho_janela )
			janela = [janela ;zeros( (tamanho_janela - (pos_fim - pos_inicio+1) ), 1) ];	% completa com zeros
            %break;
		end;
		
		% atualiza vetor de saida
		amostras_janeladas = [amostras_janeladas  janela];
		
		% se houver janelamento aqui é o ponto
		%janela(amostras_janeladas)
		
		% atualiza os "ponteiros"
		pos_inicio  = pos_inicio + tamanho_janela - sobreposicao;
		
		if ( (pos_inicio + tamanho_janela ) < tamanho_sinal )
			pos_fim = pos_inicio + tamanho_janela - 1;
		else
			pos_fim = pos_inicio + (tamanho_sinal - pos_inicio -1);	%ultima janela - pega o resto
		end;	
		
		% limpa a janela para a proxima segmentação
		janela = [];
	
	end;
