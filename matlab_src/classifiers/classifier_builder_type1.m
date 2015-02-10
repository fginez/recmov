function [ classifier ] = classifier_builder_type1( sDatabase, iFolds, strType )
%CLASSIFIER_BUILDER_TYPE1 Summary of this function goes here
%   Detailed explanation goes here

    database = [];

    % Generate k-fold databases
    database = crossvalidation_splitbases(sDatabase, iFolds);
    
    % Generate parameters grid
    grid = classifier_buildgrid( strType );
    
    % Sweep parameters grid and train
    classifiers = classifier_sweeptraining( strType, database, grid );

    % Evaluate performance
    classifier = perf_evaluator( classifiers, 'simple_perf' );
end

