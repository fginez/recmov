function [ out ] = max_out( in )

[m n] = size(in);

out = [];

for i=1:n
   o = (-1).*ones(m,1);
   [v p] = max(in(:,i));
   o(p) = 1;
   out = [ out o ];
end
