function [janelas, num] = exclui_janelas(amostras, inicio, fim)
% exclui janelas no inicio e no fim das amostras

    % obtem o tamanho da matriz
    [a b] = size(amostras);

    % copia apenas as colunas de inicio até total-fim
    janelas = amostras(:, [(inicio+1):(b - fim)]);
    
    [a num] = size(janelas);
