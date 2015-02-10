function [ out ] = encoder_parallel( in, strType )

    % Positions=   1 2 3 4 5 6 7 8
	aStaticEnc = [ 1 2 3 0 0 0 0 4 ];
	aDynamicEnc= [ 0 0 0 1 2 3 4 0 ];

	iLen = length(in);
	out  = zeros(iLen,1);	
	
	if ( strcmp( 'static' , strType ) )
		for i=1:iLen
			% use static array decoder
			out(i) = aStaticEnc ( in(i) );
		end			
	else
		for i=1:iLen
			% use dynamic array decoder
			out(i) = aDynamicEnc ( in(i) );
		end			
	end

end
