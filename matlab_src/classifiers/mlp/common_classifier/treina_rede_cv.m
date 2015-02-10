function [ net ] = treina_rede_cv(input, target, neuronios_o1, neuronios_o2, indices_treino, indices_validacao, indices_teste)

[m n] = size(target');

net = 0;

%% cria a rede neural com uma ou duas camadas ocultas
if ( neuronios_o2 == 0 )
    net = newff(minmax(input'), [neuronios_o1 m], { 'tansig', 'tansig' }, 'trainrp');
else
    net = newff(minmax(input'), [neuronios_o1 neuronios_o2 m], { 'tansig', 'tansig', 'tansig' }, 'trainrp');   
end

%inicia os pesos sinapticos e o vies
net = init(net);

%% Habilita o algoritmo de Regularização Bayesiana
%net.trainFcn = 'trainbr';  %Bayesian regularization
%net.trainFcn = 'trainlm';  %Levenberg-Marquardt
net.trainFcn = 'trainrp';  %Resilient Backpropagation
%net.trainFcn = 'traingdm';  %Gradient Descent with Momentum

%% Ajusta os critérios de parada
net.trainParam.epochs = 1000;
net.trainParam.goal   = 1e-3;
net.trainParam.min_grad = 1e-30;

%% Ajusta os parâmetros de divisão dos conjuntos
net.divideFcn = 'divideind';
net.divideParam.trainInd = indices_treino;
l = round(length(indices_teste)/2);
net.divideParam.valInd   = indices_teste(1:l);
net.divideParam.testInd  = indices_teste(l+1:length(indices_teste));

% Desabilita o conjunto de validacao
%net.divideParam.valRatio = 0;
%net.divideMode = 'sample'; % Default


%net.divideFcn = 'dividerand';
%net.divideMode = 'value';
%net.divideParam.trainRatio = 70/100;
%net.divideParam.valRatio = 15/100;
%net.divideParam.testRatio = 15/100;

net.trainParam.showCommandLine = 0;
%net.trainParam.show = 1;
net.trainParam.showWindow = 0;

%% Realiza o treinamento
[net,tr]=train(net,input',target');

