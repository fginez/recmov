function [ classifier ] = classifier_paralleltraining_mlp( database, estimated_preclasses, grid, grid_pos )
%CLASSIFIER_PARALLELTRAINING_MLP Summary of this function goes here
%   Detailed explanation goes here

    % Extract parameters
    neurons_o1 = grid.o1(grid_pos);
    neurons_o2 = grid.o2(grid_pos);

    params = [ neurons_o1 neurons_o2 ];
    
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
        
		% Split test database into static & dynamic
		[dynamic_test, static_test] = database_split_type2(test);        
        
        % Perform training        
        models = mlp_parallel_training( dynamic_train, dynamic_test, static_train, static_test, params );
        
		% Get current test fold list
		currTestFold = database(i).folds.test;
		
        % Perform simulation		
        out = mlp_parallel_classify(models, ' ', test.in, estimated_preclasses(currTestFold));
        
        % Evaluate performance        
        classperf(cp, out, database(i).folds.test );		        
        
    end
    
    % Fill output structure
    classifier = struct('model', models, 'Perf', cp.CorrectRate, 'Matrix', cp.CountingMatrix);                
end

