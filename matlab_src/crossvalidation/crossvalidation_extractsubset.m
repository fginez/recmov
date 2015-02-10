function [ sTrain, sTest] = crossvalidation_extractsubset( database, i )
%CROSSVALIDATION_EXTRACTSUBSET Summary of this function goes here
%   Detailed explanation goes here
    
    curr_data = database(i).data;
    curr_fold = database(i).folds;

    train = database(i).folds.train;
    test  = database(i).folds.test;

    sTrain = struct('i', curr_data.i(train, :), 'in', curr_data.in(train, :), 't', curr_data.t(train, :), 'p', curr_data.p(train, :));
    sTest  = struct('i', curr_data.i(test, :), 'in', curr_data.in(test, :), 't', curr_data.t(test, :), 'p', curr_data.p(test, :));

end

