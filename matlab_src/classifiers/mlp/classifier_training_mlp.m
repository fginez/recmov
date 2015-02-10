function [ classifier ] = classifier_training_mlp( database, grid, grid_pos )
%CLASSIFIER_TRAINING_MLP Summary of this function goes here
%   Detailed explanation goes here

    % Get k-folds number
    iFolds = numel(database);

    % Initialize classifier performance
    cp = classperf(database(1).data.t);
    
    % For each folder...
    for i=1:iFolds
       
        % Extract folder data subset
        [train, test ] = crossvalidation_extractsubset(database, i);
        
        % Obtain data indexes for current folder
        train_idx = find( database(i).folds.train );
        test_idx  = find( database(i).folds.test );
        dummy_idx = zeros(1, 2);
        
        % Extract parameters
        neurons_o1 = grid.o1(grid_pos);
        neurons_o2 = grid.o2(grid_pos);
        
        % Convert target from regular to encoded
        y = database(i).data.t;
        encoded_target = codifica_saida(y);
        
        % Perform training
        input = database(i).data.in;
        net = treina_rede_cv(input, encoded_target, neurons_o1, neurons_o2, train_idx, dummy_idx, test_idx);
        
        % Perform simulation
        inputtest = database(i).data.in( database(i).folds.test, : );
        out = sim(net, inputtest');
        
        % Convert output from encoded to regular
        out = decodifica_saida(out);
        
        % Evaluate performance        
        classperf(cp, out, test_idx );
    end
    
    % Fill output structure
    classifier = struct('model', {net}, 'Perf', cp.CorrectRate, 'Matrix', cp.CountingMatrix);

end

