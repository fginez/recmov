function [ classifier ] = classifier_training_svm( database, grid, grid_pos )
%CLASSIFIER_TRAINING_SVM Summary of this function goes here
%   Detailed explanation goes here

    kernel = 2; % RBF kernel

    % Get k-folds number
    iFolds = numel(database);

    % Initialize classifier performance
    cp = classperf(database(1).data.t);
    
    % Store probability estimation
    probability = [];
    
    % Store out value
    global_out = [];
    local_out = [];
    
    % For each folder...
    for i=1:iFolds
       
        % Extract folder data subset
        [train, test ] = crossvalidation_extractsubset(database, i);
        
        % Extract parameters
        c = grid.c(grid_pos);
        gamma = grid.gamma(grid_pos);
        
        % Perform training
        param = sprintf('-c %d -g %d -t %d -b 1', 2^c, 2^gamma, kernel);
        model = svmtrain(train.t, train.in, param);
        
        % Perform simulation
        Z = zeros(length(test.t), 1);
        [out, accuracy, prob_estimates] = svmpredict(Z, test.in, model, '-b 1');        
        
        % Insert inconclusive verification here!!!
        [m n] = size(prob_estimates)
        curr_p = prob_estimates;
        probability = [probability; curr_p];
        
        for j=1:m
            % get real and predicted classes
            real_class = test.t(j);
            predicted_class = out(j);
            
            %find max prob. and its idx
            [v idx] = max(curr_p(j,:));
            
            if ( v < 0.5 )
                global_out = [ global_out; real_class predicted_class 9 ];
            else
                global_out = [ global_out; real_class predicted_class predicted_class ];
            end
        end
        
        
        % Evaluate performance        
        classperf(cp, out, database(i).folds.test );
        
        global_out = [ global_out; local_out];
    end
    
    % Fill output structure
    classifier = struct('model', model, 'Perf', cp.CorrectRate, 'Matrix', cp.CountingMatrix, 'Prob', probability, 'Out', global_out);
    
end

