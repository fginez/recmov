function [ best_classifier ] = perf_evaluator( classifiers, criterion )
%PERF_EVALUATOR Summary of this function goes here
%   Detailed explanation goes here

    % Obtain the number of classifiers
    nClassifiers = length( classifiers );
    
    % Initialize internal arrays & vars
    best_idx = 1;
    perf = zeros(1, nClassifiers);
    
    % Data manipulation loop
    for i=1:nClassifiers
        perf(i) = classifiers{i}.Perf;        
    end
    
    % Performance evaluation
    [ best_perf, best_idx ] = max(perf);
    
    % Return best classifier
    best_classifier = classifiers{best_idx};
end

