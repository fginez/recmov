function [ classifiers ] = classifier_parallel_sweeptraining( strType, database, estimated_preclasses, grid )
%CLASSIFIER_PARALLEL_SWEEPTRAINING Summary of this function goes here
%   Detailed explanation goes here

    % Obtain the number of combinations
    combinations = auxclassifier_getnumel(strType, grid);
    
    classifiers = cell(1, combinations );
    
    % Classifier training loop
    for i=1:combinations
        classifiers{i} = classifier_parallel_trainingwrp(strType, database, estimated_preclasses, grid, i );
    end
    
end

