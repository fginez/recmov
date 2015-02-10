function [ out ] = decoder_parallel( in, strType )

    % Positions=   1 2 3 4 5 6 7 8
	aStaticDec = [ 1 2 3 8 ];
	aDynamicDec= [ 4 5 6 7 ];
	
	iLen = length(in);
	out  = zeros(iLen,1);

	if ( strcmp( 'static' , strType ) )
		for i=1:iLen
			% use static array decoder
			out(i) = aStaticDec ( in(i) );
		end	
	else
		for i=1:iLen
			% use dynamic array decoder
			out(i) = aDynamicDec ( in(i) );
		end		
	end

end
