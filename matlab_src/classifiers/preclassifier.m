function [ output ] = preclassifier( database, algorithm )
%PRECLASSIFIER Summary of this function goes here
%   Detailed explanation goes here

    iNumDados = length( database.i );
    
    output = zeros(iNumDados,1);
    
    if ( strcmp ( 'threshold', algorithm ) )
    
        for j=1:iNumDados   
            output(j) = preclassifier_threshold( database.i(j,:) );
        end
    elseif ( strcmp ( 'knn', algorithm ) )    
        output = preclassifier_knn ( database.i );
    elseif ( strcmp ( 'svm', algorithm ) )
        output = preclassifier_svm ( database.i );
    end
end

