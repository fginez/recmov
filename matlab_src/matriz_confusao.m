function [ c taxa ] = matriz_confusao( esperado, calculado )

% converte as matrizes para vetores 1D;
esp = [];
cal = [];

suc = 0;
err = 0;

[m n] = size(esperado);

for l=1:n
    [v p] = max(esperado(:,l));
    esp = [esp p];
    
    [v p] = max(calculado(:,l));
    cal = [cal p];    
    
    if ( esp(l) == cal(l) )
        suc = suc+1;
    else
        err = err+1;
    end
end

c = confusionmat(esp, cal);

taxa = suc/n;
