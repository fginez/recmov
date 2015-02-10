function [ output ] = preclassifier_svm( data )
%PRECLASSIFIER_KNN Summary of this function goes here
%   Detailed explanation goes here
    
    if ( 0 == exist('svmpreclass.mat', 'file') )
        
        load 'preclassdata.mat';
        kernel = 2;
        minC  = -5;
        stepC = 2;
        maxC  = 15;

        minGamma=-15;
        stepGamma= 2;
        maxGamma = 3;

        [C,gamma] = meshgrid(minC:stepC:maxC, minGamma:stepGamma:maxGamma);    

        NumCombs = numel(C);
        cv_acc = zeros(numel(C),1);

        for i=1:NumCombs

            param = sprintf('-c %d -g %d -v 10 -t %d', 2^C(i), 2^gamma(i), kernel);    
            cv_acc(i) = svmtrain( preclass_data.p, preclass_data.in, param);
        end

        [~,idx] = max(cv_acc); 

        best_C = 2^C(idx); best_gamma = 2^gamma(idx);   
        best_acc = cv_acc(idx);

        param = sprintf('-c %d -g %d -t %d', best_C, best_gamma, 2);

        svmpreclassifier = svmtrain(preclass_data.p, preclass_data.in, param);
        save ('svmpreclass.mat', 'svmpreclassifier' );
    else
        load 'svmpreclass.mat';
        
        Z = zeros(length(data), 1);
        output = svmpredict(Z, data, svmpreclassifier, '-b 0');
    end        
end