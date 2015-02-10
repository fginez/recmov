function [janelas] = preclass(janelas)

for ( i=1:length(janelas) )
    janelas(i).Preclasse = pre_classificador(janelas(i));
end;