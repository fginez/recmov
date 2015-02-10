function [rank] = fsR(X_train,Y_train)
%
[ny,yind]=sort(Y_train);

XtraNew = X_train(yind,:);
XtraNew1 = XtraNew;

na = sum(ny==-1);
a=1:na;
nb=sum(ny==1);
b=na+(1:nb);


    ma = mean(XtraNew1(a,:));
    mb = mean(XtraNew1(b,:));

disp('cal std');
stda=[];
stdb=[];
xdim = size(X_train,2);
iter = ceil(xdim/1e+4);
if iter==1
	ind=0;
end;

for i= 1:iter
	if i==iter
		ind = (ind(end)+1):xdim;
	else
		ind = [1:1e+4] + (i-1)*1e+4;
	end;

    stda = [stda, std(XtraNew1(a,ind))];
    stdb = [stdb, std(XtraNew1(b,ind))];
end;

    stdab = stda+stdb;
    stdab(stdab==0)=inf;

    fisherScore =  abs( (ma-mb)./(stdab) ) ;
[nf,rank]=sort(-fisherScore);
