function [ classifier ] = classifier_builder_type2( sNotFilteredDatabase, sFilteredDatabase, iFolds, strType )
%CLASSIFIER_BUILDER_TYPE1 Summary of this function goes here
%   Detailed explanation goes here

    filtered_database = [];
    notfiltered_database = [];

    % Generate k-fold databases
    %filtered_database = crossvalidation_splitbases(sFilteredDatabase, iFolds);
    notfiltered_database = crossvalidation_splitbases(sNotFilteredDatabase, iFolds);
    
    % Generate parameters grid
    grid = classifier_buildgrid( strType );
    
	% Preclassify using filtered database and the specified algorithm
	estimated_preclasses = preclassifier( sFilteredDatabase, 'threshold' );
	
    % Sweep parameters grid and train
    classifiers = classifier_parallel_sweeptraining( strType, notfiltered_database, estimated_preclasses, grid );

    % Evaluate performance
    classifier = perf_evaluator( classifiers, 'simple_perf' );
end


