function [ rawmatrix ] = build_rawmatrix( filename )

%load pre-formated database
load (filename);

D=formata_dados(D);
D=extrai_caracteristicas(D);
[i, in, t, p] = gen_rawmatrix(D);

%format output matrix
rawmatrix = struct('i', i, 'in', in, 't', t, 'p', p);

end