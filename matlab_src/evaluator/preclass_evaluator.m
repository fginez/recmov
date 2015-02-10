function [ best_classifier ] = preclass_evaluator( database, classifiers )

    expected_targets = database.p;        
    iNum = length(classifiers);
    iNumSamples = length(expected_targets);
    perf = zeros(1, iNum);
    
    for i=1:iNum
        tmp = sum ( xor( classifiers(i).estimated_preclasses, expected_targets ) );
        perf(i) = (iNumSamples - tmp)/iNumSamples;
    end
    
    [val idx] = max(perf);
    
    best_classifier = classifiers(idx);
    
end