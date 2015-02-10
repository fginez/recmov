clear;

D_nf = [];
D_fpa= [];

% Abre o dialogo para escolha dos arquivos
[FileName,PathName,FilterIndex] = uigetfile('*.mat','Database-files (*.mat)','Bases de dados','MultiSelect', 'on');

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

Temp_D = [];

for k=1:NumArquivos

    % Obtem o nome do arquivo para abrir
    if ( NumArquivos == 1 )
        currFileName = FileName;
    else
        currFileName = FileName{k};
    end
    Arquivo = [];
    Arquivo = strcat(PathName, currFileName);
    
    load(Arquivo);
    disp('===[ PARTIAL RESULT]=================');
    disp(Arquivo);
    disp(enumera_ativs(D));
   
    Temp_D = [ Temp_D D ];
end

D = Temp_D;

[filename, pathname] = uiputfile(...
                                 {'*.mat';'*.*'},...
                                 'Save as');
                             
if (filename == 0)
    disp('ERRO! Você precisa especificar um nome de arquivo de saída');
    return;
else
    filename = strcat(pathname, filename);
    ArquivoSaida = strcat(filename(1:length(filename)-4), '.mat');
    
    save(ArquivoSaida, 'D');
end

disp('==================[ MERGE RESULTS]===================================');
disp(enumera_ativs(D));
disp('=====================================================================');

