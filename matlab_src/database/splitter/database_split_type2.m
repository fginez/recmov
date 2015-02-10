function [dynamic, static] = database_split_type2(database)

	%initialize variables
	static  = struct('i', [], 'in', [], 't', [], 'p', [] );
	dynamic = struct('i', [], 'in', [], 't', [], 'p', [] );

	iLen = length(database.in);
    
	for i=1:iLen
        
        tmp_i = database.i(i, :);
        tmp_in = database.in(i, :);
        tmp_t = database.t(i, :);
        tmp_p = database.p(i, :);
        
		if ( database.p(i) == 0 )
			%static data
			static.i = [ static.i; tmp_i ];
            static.in = [ static.in; tmp_in ];
            static.t = [ static.t; tmp_t ];
            static.p = [ static.p; tmp_p ];
		elseif ( database.p(i) == 1 )
			%dynamic data
			dynamic.i = [ dynamic.i; tmp_i ];
            dynamic.in = [ dynamic.in; tmp_in ];
            dynamic.t = [ dynamic.t; tmp_t ];
            dynamic.p = [ dynamic.p; tmp_p ];
		end
	end
	
end
