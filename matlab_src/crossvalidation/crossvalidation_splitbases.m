function [ output ] = crossvalidation_splitbases( sDataBase, iFolds )
%CROSSVALIDATION_SPLITBASES Summary of this function goes here
%   Detailed explanation goes here
    
    % Initialization
    output = [];
    folds = cell(1, iFolds);

    % Generate k-folds indexes
    indexes = crossvalind('Kfold', sDataBase.t , iFolds);
        
    % Generate k-folds databases
    for i=1:iFolds
       
        % Build indexes for training and testing
        test = (indexes == i); train = ~test;
                
        % Build datasets
        %strTrain = struct('i', sDataBase.i(train, :), 'in', sDataBase.in(train, :), 't', sDataBase.t(train, :), 'p', sDataBase.p(train, :));
        %strTest  = struct('i', sDataBase.i(test, :), 'in', sDataBase.in(test, :), 't', sDataBase.t(test, :), 'p', sDataBase.p(test, :));
        
        % Fill output
        %output{i} = struct('train', strTrain, 'test', strTest, 'idxtrain', train, 'idxtest', test);
        folds{i} = struct('train', train, 'test', test);
        
    end
    
    output = struct('folds', folds, 'data', sDataBase);
    
end

