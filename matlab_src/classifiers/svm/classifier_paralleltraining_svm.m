function [ classifier ] = classifier_paralleltraining_svm( database, estimated_preclasses, grid, grid_pos )
%CLASSIFIER_PARALLELTRAINING_SVM Summary of this function goes here
%   Detailed explanation goes here

    % TODO: Put into a configuration file
    kernel = 2;

    % Extract parameters
    c = grid.c(grid_pos);
    gamma = grid.gamma(grid_pos);    
    param = sprintf('-c %d -g %d -t %d', 2^c, 2^gamma, kernel);
    
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
        models = svm_parallel_training( dynamic_train, static_train, param );
		
		% Get current test fold list
		currTestFold = database(i).folds.test;
		
        % Perform simulation		
        out = svm_parallel_classify(models, '-b 0', test.in, estimated_preclasses(currTestFold));
        
        % Evaluate performance        
        classperf(cp, out, database(i).folds.test );		
    end
    
    % Fill output structure
    classifier = struct('model', models, 'Perf', cp.CorrectRate, 'Matrix', cp.CountingMatrix);        

end

