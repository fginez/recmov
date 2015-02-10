function FDR=FDR_comp(X,y,ind)
%Fisher's discriminant ratio

[l,N]=size(X);
c=max(y);
for i=1:c
    y_temp=(y==i);
    X_temp=X(ind,y_temp);
    m(i)=mean(X_temp);
    vari(i)=var(X_temp);
end

a=nchoosek(1:c,2);
q1=( (m(a(:,1))-m(a(:,2))).^ 2 );
q2=( (vari(a(:,1))+vari(a(:,2))));
q= q1./q2;
FDR=sum(q);