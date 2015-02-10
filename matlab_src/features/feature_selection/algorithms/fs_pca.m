function [variances, out] = fs_pca( input )
% input: Entrada no formato Amostras X Features

% Calcula o PCA
[pc,variances,explained] = pcacov(input');

% Ordena os vetores
[varsorted,varsortedinds] = sort(variances,'descend');

% Prepara a saída
pca_features = varsortedinds;
out = pc(:,varsortedinds);  % entrada transformada