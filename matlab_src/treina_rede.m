function [ net ] = treina_rede(input, target, neuronios_o1, neuronios_o2)

[m n] = size(target);

net = 0;

% cria a rede neural com uma ou duas camadas ocultas
if ( neuronios_o2 == 0 )
    net = newff(minmax(input), [neuronios_o1 m], { 'tansig', 'tansig' }, 'trainrp');
else
    net = newff(minmax(input), [neuronios_o1 neuronios_o2 m], { 'tansig', 'tansig', 'tansig' }, 'trainrp');   
end

net.trainParam.epochs = 1000;
net.trainParam.goal   = 1e-5;
net.divideFcn = 'dividetrain';
net.divideMode = 'sample'; % Default

%net.divideFcn = 'dividerand';
%net.divideMode = 'value';
%net.divideParam.trainRatio = 70/100;
%net.divideParam.valRatio = 15/100;
%net.divideParam.testRatio = 15/100;
net = init(net);

[net,tr]=train(net,input,target);

