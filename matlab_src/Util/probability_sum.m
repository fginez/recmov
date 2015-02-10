function [p] = probability_sum( prob_array )

	num_classes = 8;

	% Signal matrix
	sign =  [ 1 1 1 1 1 1 1;
			 -1 1 1 1 1 1 1;
			 -1 -1 1 1 1 1 1;
			 -1 -1 -1 1 1 1 1;
			 -1 -1 -1 -1 1 1 1;
			 -1 -1 -1 -1 -1 1 1;
			 -1 -1 -1 -1 -1 -1 1;
			 -1 -1 -1 -1 -1 -1 -1 ];

	% Position matrix
	posi = [ 1 2 3 4 5 6 7;
			 1 8 9 10 11 12 13;
			 2 8 14 15 16 17 18;
			 3 9 14 19 20 21 22;
			 4 10 15 19 23 24 25;
			 5 11 16 20 23 26 27;
			 6 12 17 21 24 26 28;
			 7 13 18 22 25 27 28 ];

	p = zeros(1, num_classes);

	for i = 1:num_classes

		for j = 1:num_classes-1
			p(i) = p(i) + ( sign(i,j) * prob_array(posi(i,j)) );
		end

	end

end
