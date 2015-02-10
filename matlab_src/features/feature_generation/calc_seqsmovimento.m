function [quant] = calc_seqsmovimento(x,tolerancia)
%Dar credito a Gyllensten

datalength = length(x);
quant = 1;
for i=1:datalength-1
    lowi = i;
    
    while((abs(x(i)-x(lowi))<tolerancia)&&(lowi>1))
        lowi = lowi-1;
    end
    
    if(quant<i-lowi)
        quant = i - lowi;
    end
end

end