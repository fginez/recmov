function [ models ] = svm_parallel_training( dynamic_train, static_train, param )
%SVM_PARALLEL_TRAINING Summary of this function goes here
%   Detailed explanation goes here

    % Variables initialization
    models =[];
    
    % test points
    in = dynamic_train.in;
    t  = dynamic_train.t;    
    in = static_train.in;
    t  = static_train.t;
    
    %% Dynamic model generation
    
    % encode targets
    encoded_targets = encoder_parallel(dynamic_train.t, 'dynamic' );
    dynamic_model = svmtrain ( encoded_targets, dynamic_train.in, param );
    
    %debug1 = [ dynamic_train.t encoded_targets ];
    
    %% Static model generation
    encoded_targets = encoder_parallel(static_train.t, 'static' );
    static_model  = svmtrain ( encoded_targets, static_train.in, param );
    
    %debug2 = [ static_train.t encoded_targets ];
    %% Output fill    
    models = [ dynamic_model static_model ];

end

