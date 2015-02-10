function [ classifier ] = classifier_paralleltraining_knn( database, estimated_preclasses, grid, grid_pos )
%CLASSIFIER_PARALLELTRAINING_KNN Summary of this function goes here
%   Detailed explanation goes here

    % Get k-folds number
    iFolds = numel(database);

    % Initialize classifier performance
    cp = classperf(database(1).data.t);
    
    % For each folder...
    for i=1:iFolds
        
        % Extract folder data subset
        [train, test ] = crossvalidation_extractsubset(database, i);

		% Split train database into static & dynamic
		[dynamic_train, static_train] = database_split_type2(train);
		
        % Perform training
        % There's no training in kNN
		
		% Get current test fold list
		currTestFold = database(i).folds.test;
		
        % Perform simulation		
        out = knn_parallel_classify(test.in, estimated_preclasses(currTestFold) , dynamic_train, static_train, grid(grid_pos));
        
        % Evaluate performance        
        classperf(cp, out, database(i).folds.test );		
    end
    
    % Fill output structure
    model = sprintf('knn k=%d', grid(grid_pos));
    classifier = struct('model', model, 'Perf', cp.CorrectRate, 'Matrix', cp.CountingMatrix);        
end
