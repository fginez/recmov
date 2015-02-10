function [ out ] = none_class_calc( input, prob, labels )
%NONE_CLASS_CALC Summary of this function goes here
%   Detailed explanation goes here

   [m n] = size(prob);
   
   out=zeros(m,1);
   errors=0;
   for i=1:m
      [v j] = max(prob(i,:));
      if ( translate_libsvm_label(j, labels) ~= input(i))
          out(i) = 9;
          errors=errors+1;
      else
          out(i) = input(i);
      end
   end

end

