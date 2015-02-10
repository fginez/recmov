function [classifier] = find_best_preclassifier()

    % Load filtered data
    preclassdata = build_rawmatrix('all_users_fpa.mat');

    % Test different combinations
    estimated_preclasses = preclassifier( preclassdata, 'threshold' );
    thr_model = struct('type', 'threshold', 'estimated_preclasses', estimated_preclasses);
    
    estimated_preclasses = preclassifier( preclassdata, 'knn' );
    knn_model = struct('type', 'knn', 'estimated_preclasses', estimated_preclasses);
    
    estimated_preclasses = preclassifier( preclassdata, 'svm' );
    svm_model = struct('type', 'svm', 'estimated_preclasses', estimated_preclasses);
    
    classifiers = [ thr_model knn_model svm_model ];
    
    classifier = preclass_evaluator(preclassdata, classifiers);
end
