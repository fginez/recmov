function [rank] = pcc_eval(x, y)

[ l m ] = size (x);
rank =[];
for i=1:m
    X = x(: , i); 
    r = corr(X,y);
    rank = [rank r];
end

[ ~, rank]  = sort(rank, 'descend');