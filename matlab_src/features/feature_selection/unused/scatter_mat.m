function [Sw,Sb,Sm]=scatter_mat(X,y)
% Computes the within-class (Sw), between-class (Sb) and mixture (Sm) scatter matrices for an c-class classification problem 
% X: Matriz lxN onde cada linha é um novo dado
% y: Vetor linha que contém os rotulos de classe
	[l,N]=size(X);
    c=max(y);
    %Computation of class mean vectors, a priori prob. and
    %Sw
    m=[];
    X_temp=[];
    Sw=zeros(l);
    for i=1:c
        y_temp=(y==i);
        X_temp=X(:,y_temp);
        P(i)=sum(y_temp)/N;
        m(:,i)=(mean(X_temp'))';
        Sw=Sw+P(i)*cov(X_temp');
    end
    
    %Computation of Sb
    m0=(sum(((ones(l,1)*P).*m)'))';
    Sb=zeros(l);
    for i=1:c
        Sb=Sb+P(i)*((m(:,i)-m0)*(m(:,i)-m0)');
    end
    
    %Computation of Sm
    Sm=Sw+Sb;  