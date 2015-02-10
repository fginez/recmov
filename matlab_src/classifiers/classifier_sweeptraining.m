function [ classifiers ] = classifier_sweeptraining( strType, database, grid )
%CLASSIFIER_SWEEPTRAINING Summary of this function goes here
%   Detailed explanation goes here

    % Obtain the number of combinations
    combinations = auxclassifier_getnumel(strType, grid);
    
    classifiers = cell(1, combinations );
    
    % Classifier training loop
    for i=1:combinations
        classifiers{i} = classifier_trainingwrp(strType, database, grid, i );
    end

end

