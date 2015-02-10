clear;
filtra = 0;

% Abre o dialogo para escolha dos arquivos
[FileName,PathName,FilterIndex] = uigetfile('*.dat','Sample-files (*.dat)','Arquivo de amostragem','MultiSelect', 'on');

% Verifica se algo foi selecionado
if ( FilterIndex == 0 )
    disp('ERRO: Não foi selecionado arquivo algum');
    return;
else
    
    % Verifica se houve seleção multipla
    if (iscellstr(FileName))
       NumArquivos=numel(FileName);
    else
       NumArquivos=1;
    end
end

Arquivo = strcat(PathName, FileName);

% Carrega os dados do arquivo
[M i X Y Z A] = importa_dados(Arquivo);

% filtragem dos sinais
if ( filtra == 1)
    h = fpf_eliptico_01_7;
    [b,a] = sos2tf(h.sosMatrix,h.scaleValues); %IIR
    X=filter(b,a,X);
    Y=filter(b,a,Y);
    Z=filter(b,a,Z);
end

% Encontra as fronteiras entre diferentes atividades
fronteiras = encontra_fronteiras(A);

total_fronteiras = length(fronteiras);
front_ant = 1;
front_prx = 1;

ativ_X = [];

Dados = [];

% Segmenta o buffer bruto em atividades
for i=1:total_fronteiras
    ativ_X = X(front_ant:fronteiras(i)-1);
    ativ_Y = Y(front_ant:fronteiras(i)-1);
    ativ_Z = Z(front_ant:fronteiras(i)-1);
    
    %Estrutura de dados brutos
    d = struct('x', ativ_X, 'y', ativ_Y, 'z', ativ_Z); 
       
    %Estrutura descritiva da atividade
    s = struct('Tamanho', length(ativ_X), 'Atividade', A(front_ant), 'NomeAtiv', rotulo_atividade(A(front_ant)), 'Amostras', d, 'Janelas', []);
    
    %Armazena a atividade junto as outras
    Dados = [ Dados s ];
    
    %Atualiza "ponteiro"
    front_ant=fronteiras(i);
end;

tam_janela = 128;
sobre_janela = 64;

% Segmenta em janelas cada uma das estruturas de atividades
for i=1:length(Dados)
    
    Janelas_X = obtem_janelas(Dados(i).Amostras.x, tam_janela, sobre_janela);
    Janelas_Y = obtem_janelas(Dados(i).Amostras.y, tam_janela, sobre_janela);
    Janelas_Z = obtem_janelas(Dados(i).Amostras.z, tam_janela, sobre_janela);

    [a b] = size(Janelas_X);
    
    s_Dados = struct('x', Janelas_X, 'y', Janelas_Y, 'z', Janelas_Z);
    s_Janelas = struct('N', tam_janela, 'Sobreposicao', sobre_janela, 'NJanelas', b, 'Dados', s_Dados);
    
    Dados(i).Janelas = s_Janelas;
    
end

% O resultado de saida será um arquivo .mat com a estrutura de janelas +
% classificação
if ( filtra == 0 )
    ArquivoSaida = strcat(Arquivo(1:length(Arquivo)-4), '.mat');
else
    ArquivoSaida = strcat(Arquivo(1:length(Arquivo)-4), '_fpa.mat');
end   

save(ArquivoSaida, 'Dados');
