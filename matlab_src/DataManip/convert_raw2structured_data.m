clear;

D_nf = [];
D_fpa= [];

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

for k=1:NumArquivos

    % Obtem o nome do arquivo para abrir
    if ( NumArquivos == 1 )
        currFileName = FileName;
    else
        currFileName = FileName{k};
    end
    Arquivo = [];
    Arquivo = strcat(PathName, currFileName);

    % Carrega os dados do arquivo
    clear M;
    clear i;
    clear X;
    clear Y;
    clear Z;
    clear A;
    [M i X Y Z A] = importa_dados(Arquivo);

    % Encontra as fronteiras entre diferentes atividades
    fronteiras = encontra_fronteiras(A);

    total_fronteiras = length(fronteiras);
    front_ant = 1;
    front_prx = 1;

    %% Processa dados sem a filtragem
    ativ_X = [];
    ativ_Y = [];
    ativ_Z = [];
    Dados_nf = [];

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
        Dados_nf = [ Dados_nf s ];

        %Atualiza "ponteiro"
        front_ant=fronteiras(i);
    end;

    tam_janela = 128;
    sobre_janela = 64;

    % Segmenta em janelas cada uma das estruturas de atividades
    for i=1:length(Dados_nf)

        Janelas_X = obtem_janelas(Dados_nf(i).Amostras.x, tam_janela, sobre_janela);
        Janelas_Y = obtem_janelas(Dados_nf(i).Amostras.y, tam_janela, sobre_janela);
        Janelas_Z = obtem_janelas(Dados_nf(i).Amostras.z, tam_janela, sobre_janela);

        [a b] = size(Janelas_X);

        s_Dados = struct('x', Janelas_X, 'y', Janelas_Y, 'z', Janelas_Z);
        s_Janelas = struct('N', tam_janela, 'Sobreposicao', sobre_janela, 'NJanelas', b, 'Dados', s_Dados);

        Dados_nf(i).Janelas = s_Janelas;

    end

    % Remove as atividades indesejadas para a formação da base de dados
    % e faz o append
    D_nf = [D_nf remove_atividades( Dados_nf ) ];
    
   

    %% Repete o processo filtrando os sinais
    % filtragem dos sinais

    %h = fpf_eliptico_01_7;
    h = fpf_bw_03_15;
    [b,a] = sos2tf(h.sosMatrix,h.scaleValues); %IIR
    X=filter(b,a,X);
    Y=filter(b,a,Y);
    Z=filter(b,a,Z);

    ativ_X = [];
    ativ_Y = [];
    ativ_Z = [];
    Dados_fpa = [];

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
        Dados_fpa = [ Dados_fpa s ];

        %Atualiza "ponteiro"
        front_ant=fronteiras(i);
    end;

    tam_janela = 128;
    sobre_janela = 64;

    % Segmenta em janelas cada uma das estruturas de atividades
    for i=1:length(Dados_fpa)

        Janelas_X = obtem_janelas(Dados_fpa(i).Amostras.x, tam_janela, sobre_janela);
        Janelas_Y = obtem_janelas(Dados_fpa(i).Amostras.y, tam_janela, sobre_janela);
        Janelas_Z = obtem_janelas(Dados_fpa(i).Amostras.z, tam_janela, sobre_janela);

        [a b] = size(Janelas_X);

        s_Dados = struct('x', Janelas_X, 'y', Janelas_Y, 'z', Janelas_Z);
        s_Janelas = struct('N', tam_janela, 'Sobreposicao', sobre_janela, 'NJanelas', b, 'Dados', s_Dados);

        Dados_fpa(i).Janelas = s_Janelas;

    end

    % Remove as atividades indesejadas para a formação da base de dados
    D_fpa = [D_fpa remove_atividades( Dados_fpa )];

end

% O resultado de saida será um arquivo .mat com a estrutura de janelas +
% classificação
[filename, pathname] = uiputfile(...
                                 {'*.mat';'*.*'},...
                                 'Save as');
                             
if (filename == 0)
    disp('ERRO! Você precisa especificar um nome de arquivo de saída');
else
    filename = strcat(pathname, filename);
    ArquivoSaida = strcat(filename(1:length(filename)-4), '_nf.mat');
    clear D;
    D = D_nf;
    D = make_structcompatible(D);
    save(ArquivoSaida, 'D');

    disp('=======================[ RESUMO DA EXECUÇÃO ]=======================');
    tmpstr=['Arquivo: ', ArquivoSaida];
    disp(tmpstr);
    disp('Janelas/Classe:');
    disp(enumera_ativs(D_nf));


    ArquivoSaida = strcat(filename(1:length(filename)-4), '_fpa.mat');
    clear D;
    D = D_fpa;
    D = make_structcompatible(D);    
    save(ArquivoSaida, 'D');

    tmpstr=['Arquivo: ', ArquivoSaida];
    disp(tmpstr);
    disp('Janelas/Classe:');
    disp(enumera_ativs(D_fpa));

    disp('=====================================================================');
end
