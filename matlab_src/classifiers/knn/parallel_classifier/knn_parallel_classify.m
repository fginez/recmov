function [ out ] = knn_parallel_classify( test_data, estimated_preclasses, dynamic_base, static_base, neighbours )
%KNN_PARALLEL_CLASSIFY Summary of this function goes here
%   Detailed explanation goes here
    
	% variables initialization
	iLen = length(test_data);
	out  = zeros(iLen, 1);
	
	% Perform test of each sample individually
	% TODO: is there any way to solve this?
	for i=1:iLen
	
		% Get preclassification info
		pre_class = estimated_preclasses(i);
	
		if (pre_class == 0)
            
            % encode static targets
            % Not necessary for label based classifiers
            
			% Use static classifier for test
			y = knnclassify( test_data(i, :), static_base.in, static_base.t, neighbours );
            
            % decode static targets            
            % Not necessary for label based classifiers            
        else
            
            % encode dynamic targets            
            % Not necessary for label based classifiers
            
			% Use dynamic classifier for test
			y = knnclassify( test_data(i, :), dynamic_base.in, dynamic_base.t, neighbours );
            
            % decode dynamic targets                        
            % Not necessary for label based classifiers            
		end
		
		out(i) = y;
    end    
end
