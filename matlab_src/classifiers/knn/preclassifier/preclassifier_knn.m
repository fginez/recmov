function [ output ] = preclassifier_knn( data )
%PRECLASSIFIER_KNN Summary of this function goes here
%   Detailed explanation goes here
    load 'preclassdata.mat';

    output = knnclassify(data, preclass_data.in, preclass_data.p, 3, 'cityblock');

end

