function [ classifier ] = classifier_parallel_trainingwrp( strType, database, estimated_preclasses, grid, grid_pos )
%CLASSIFIER_PARALLEL_TRAININGWRP Summary of this function goes here
%   Detailed explanation goes here

    if ( strcmp( 'knn', strType ) )

        classifier = classifier_paralleltraining_knn( database, estimated_preclasses, grid, grid_pos );
        
    elseif ( strcmp( 'mlp', strType) )

        classifier = classifier_paralleltraining_mlp( database, estimated_preclasses, grid, grid_pos );        
        
    elseif ( strcmp( 'svm', strType) )

        classifier = classifier_paralleltraining_svm( database, estimated_preclasses, grid, grid_pos );
        
    end

end

