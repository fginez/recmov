function [M i X Y Z A] = importa_dados(Arquivo)
% abre o arquivo de dados e devolve uma matriz bruta
% contendo [ M i X Y Z A ]

M = importdata(Arquivo, '|', 1);

X=M.data(:,3);
Y=M.data(:,4);
Z=M.data(:,5);
A=M.data(:,6);
i=1:length(A);
i=i';
