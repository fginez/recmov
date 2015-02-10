function [ out ] = auto_feature_selection( input, targets, algorithm )
%AUTO_FEATURE_SELECTION Summary of this function goes here
%   Detailed explanation goes here

    [len number_of_features] = size(input);

	% Select features using PCA
	if ( strcmp('pca', algorithm) )	
        % variances = variances list
        % out = transformed vector
		[variances out ]= fs_pca( input );
		out = out( :, 1:number_of_features);	
        
        for i=1:number_of_features
            if variances(i) < 1;
                break;
            end
        end
        
        out = out(:, 1:i-1);
            
	% Select features using FISHER'S SCORES	
	elseif ( strcmp('fs', algorithm) )
		fs_features = fsFisher(input, targets);
		features = fs_features.fList;
        
        s = fs_features.W(features);
        
        for i=1:number_of_features
            if s(i) < 1
               break; 
            end
        end
        
		out = input(:, features);
		out = out(:, 1:i-1);
	end;
    
end

