function [ num ] = auxclassifier_getnumel( type, grid )
%AUXCLASSIFIER_GETNUMEL Summary of this function goes here
%   Detailed explanation goes here

    if (strcmp('knn', type) )
        num = numel(grid);
    elseif (strcmp('mlp', type) )
        num = numel(grid.o1);
    elseif (strcmp('svm', type) )
        num = numel(grid.c);        
    end
end

