function [ classifier ] = classifier_training_knn( database, grid, grid_pos )
%CLASSIFIER_TRAINING_KNN Summary of this function goes here
%   Detailed explanation goes here

    % Get k-folds number
    iFolds = numel(database);

    % Initialize classifier performance
    cp = classperf(database(1).data.t);
    
    % For each folder...
    for i=1:iFolds
       
        % Extract folder data subset
        [train, test ] = crossvalidation_extractsubset(database, i);
        
        % Perform training
        % There's no training in kNN
        
        % Perform simulation
        out = knnclassify(test.in, train.in, train.t, grid(grid_pos));
        
        % Evaluate performance        
        classperf(cp, out, database(i).folds.test );
    end
    
    % Fill output structure
    model = sprintf('knn k=%d', grid(grid_pos));
    classifier = struct('model', model, 'Perf', cp.CorrectRate, 'Matrix', cp.CountingMatrix);
end
