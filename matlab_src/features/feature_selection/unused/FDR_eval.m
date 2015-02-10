function FDR=FDR_eval(X,y)

[l,N]=size(X');
FDR = [];
for i=1:N
   fdr = fdr_comp(X, y, i);
   FDR = [FDR fdr];
end

[~, FDR] = sort(FDR, 'descend');