clear
load all_users_nf;
svm1_fs = [];
svm1_fs = zeros(1, 10);

for i = 1:10
    a2 = find_best_classifier(2,'svm', 'fs');
    svm1_fs(i) = a2.Perf;
end
