function [estaticas dinamicas] = particiona_atividades(janelas_din, janelas_est)

estaticas = [];
dinamicas = [];

for i=1:length(janelas_din)
    ativ = janelas_din(i).Atividade;
    if ( janelas_din(i).Preclasse == 1 ) % dinamica
        dinamicas = [ dinamicas janelas_din(i)];
    else
        estaticas = [ estaticas janelas_est(i)];
    end    	
end
