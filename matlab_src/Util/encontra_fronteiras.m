function [ fronteiras ] = encontra_fronteiras( A )

fronteiras = [];

Ativ_ant = A(1);

for (i=1:length(A))
    if ( A(i) ~= Ativ_ant )
        fronteiras = [fronteiras i];
        Ativ_ant = A(i);
    end
end

fronteiras = [fronteiras i];

