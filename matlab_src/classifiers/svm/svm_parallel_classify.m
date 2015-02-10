function [ out ] = svm_parallel_classify( models, param, test_data, estimated_preclasses )
%SVM_PARALLEL_CLASSIFY Summary of this function goes here
%   Detailed explanation goes here

    % DEBUG
    debug = [];

	% variables initialization
	iLen = length(test_data);
	out  = zeros(iLen, 1);
    dynamic_model = models(1);
    static_model  = models(2);
    
	% Perform test of each sample individually
	% TODO: is there any way to solve this?
	for i=1:iLen
    
		% Get current preclassification info
		pre_class = estimated_preclasses(i);
                
        % Switch model
        if (pre_class == 0)            
            model = static_model;
        else
            model = dynamic_model;             
        end
        
        % Test point
        test = test_data(i, :);
        
        % Classify input sample
        y = svmpredict( 0, test_data(i, :), model, param );        
      
        % Decode and fill output buffer
        if (pre_class == 0)            
            out(i) = decoder_parallel( y, 'static');
        else          
            out(i) = decoder_parallel( y, 'dynamic');
        end        

        % DEBUG
        %if ( pre_class == 1 )
        %    debug = [ debug; y out(i) ];
        %end                
    end
    
end

