function [n] = calc_norma(x,y,z)

n = [];

for i = 1:length(x)
    n(i) = sqrt( x(i)^2 + y(i)^2 + z(i)^2 );
end