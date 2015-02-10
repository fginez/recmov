function [ parameters ] = classifier_buildgrid( type )
%CLASSIFIER_BUILDGRID Summary of this function goes here
%   Detailed explanation goes here

    if ( strcmp( 'knn', type ) )
        %k-NN parameters grid
        
        iMinNeighbours = 1;
        iMaxNeighbours = 10;
        iNeighboursStep = 1;
        
        grid = iMinNeighbours:iNeighboursStep:iMaxNeighbours;
    elseif ( strcmp( 'mlp', type) )
        %ANN MLP parameters grid
        MinNeurons_1=20;
        %NeuronStep  = 2; 
        NeuronStep  = 5;
        MaxNeurons_1=30;

        MinNeurons_2=0;
        MaxNeurons_2=30;
        
        [o1,o2] = meshgrid(MinNeurons_1:NeuronStep:MaxNeurons_1, MinNeurons_2:NeuronStep:MaxNeurons_2);
        grid = struct('o1', o1, 'o2', o2);
    elseif ( strcmp( 'svm', type) )
        
        minC  = -5;
        stepC = 2;
        maxC  = 15;
        
        minGamma=-15;
        stepGamma= 2;
        maxGamma = 3;
        
        [C,gamma] = meshgrid(minC:stepC:maxC, minGamma:stepGamma:maxGamma);
        
        grid = struct('c', C, 'gamma', gamma);
    end
    
    parameters = grid;
    
end