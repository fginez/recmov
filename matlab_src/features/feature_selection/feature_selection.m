function [ out ] = feature_selection( input, targets, number_of_features, algorithm )
% feature_selection function
% usage: [out] = feature_selection( input, number_of_features, algorithm )
%	@input - vector with format samples X features
%	@number of features - number of desired features in the output vector
%	@algorithm - used to select features (pca or fs)

	% Select features using PCA
	if ( strcmp('pca', algorithm) )	
		out = fs_pca( input );
		out = out( :, 1:number_of_features);	

	% Select features using FISHER'S SCORES	
	elseif ( strcmp('fs', algorithm) )
		fs_features = fsFisher(input, targets);
		fs_features = fs_features.fList;
        
        
        
		out = input(:, fs_features);
		out = out(:, 1:number_of_features);
	end;

end
