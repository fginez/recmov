function [ classifier ] = classifier_trainingwrp( strType, database, grid_params, grid_pos )
%CLASSIFIER_TRAININGWRP Summary of this function goes here
%   Detailed explanation goes here

    if ( strcmp( 'knn', strType ) )

        classifier = classifier_training_knn( database, grid_params, grid_pos );
        
    elseif ( strcmp( 'mlp', strType) )

        classifier = classifier_training_mlp( database, grid_params, grid_pos );        
        
    elseif ( strcmp( 'svm', strType) )

        classifier = classifier_training_svm( database, grid_params, grid_pos );
        
    end
end

