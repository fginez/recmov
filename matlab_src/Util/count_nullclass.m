function [ output ] = count_nullclass( input )
%COUNT_NULLCLASS Summary of this function goes here
%   Detailed explanation goes here
    output = zeros(8,8);
    [m n] = size(input);
    for i=1:m
        if ( input(i, 3) == 9 )
            rclass = input(i,1);
            pclass = input(i,2);
            count = output( rclass, pclass ) + 1;
            output(pclass, rclass) = count;
        end
    end
end

