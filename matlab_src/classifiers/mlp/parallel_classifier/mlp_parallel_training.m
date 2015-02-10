function [ models ] = mlp_parallel_training( dynamic_train, dynamic_test, static_train, static_test, param )
%MLP_PARALLEL_TRAINING Summary of this function goes here
%   Detailed explanation goes here

    % Variables initialization
    models = {};
    neurons_o1 = param(1);
    neurons_o2 = param(2);
    
    % test points
    in = dynamic_train.in;
    t  = dynamic_train.t;    
    in = static_train.in;
    t  = static_train.t;
    
    %% Dynamic model generation
        
    % Build a "messy" input/output vector
    input = [ dynamic_train.in; dynamic_test.in];
    train_idx = 1:length(dynamic_train.in);
    tmp = length(dynamic_train.in) + 1;
    test_idx  = tmp:(tmp + length(dynamic_test.in) - 1);
    dummy_idx = [ 0 ];
    
    targets  = [dynamic_train.t ;dynamic_test.t];
    
    % encode targets
    encoded_targets = encoder_parallel(targets, 'dynamic' );
    encoded_matrix  = codifica_saida_paralela(encoded_targets);
    
    % perform training    
    dynamic_model = treina_rede_cv ( input, encoded_matrix, neurons_o1, neurons_o2, train_idx, dummy_idx, test_idx );
    
    
    %% Static model generation
    
    % Build a "messy" input/output vector
    input = [ static_train.in; static_test.in];
    train_idx = 1:length(static_train.in);
    tmp = length(static_train.in) + 1;
    test_idx  = tmp:(tmp + length(static_test.in) - 1);
    dummy_idx = [ 0 ];
    
    targets  = [static_train.t ;static_test.t];
    
    % encode targets
    encoded_targets = encoder_parallel(targets, 'static' );
    encoded_matrix  = codifica_saida_paralela(encoded_targets);
    
    % perform training
    static_model  = treina_rede_cv ( input, encoded_matrix, neurons_o1, neurons_o2, train_idx, dummy_idx, test_idx );
    
    %% Output fill
    models{1} = dynamic_model;
    models{2} = static_model;

end

