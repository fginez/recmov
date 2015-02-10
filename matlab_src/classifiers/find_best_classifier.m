function [classifier] = find_best_classifier(arch, type, featsel)

%TODO: Put into a configuration file
kfolds = 5;

    if ( arch == 1 )
    
        % Load database
        nfdata = build_rawmatrix('all_users_nf.mat');
        
        % Select features
        nfdata.in = auto_feature_selection(nfdata.in, nfdata.t, featsel);
        
        % Build best classifier configuration
        classifier = classifier_builder_type1(nfdata, kfolds, type);
        
    elseif ( arch == 2 )      
        
        % Load databases
        nfdata = build_rawmatrix('all_users_nf.mat');
        fdata = build_rawmatrix('all_users_fpa.mat');
        
        % Select features
        nfdata.in = auto_feature_selection(nfdata.in, nfdata.t, featsel);
        
        % Build best classifier configuration
        classifier = classifier_builder_type2(nfdata, fdata, kfolds, type);
    end
    
end