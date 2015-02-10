function [para] = copy_preclass(de, para)

for ( i=1:length(de) )
    para(i).Preclasse = de(i).Preclasse;
end;
