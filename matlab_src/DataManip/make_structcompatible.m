function [out] = make_structcompatible( in )
temp_struct = [];

temp_struct = rmfield(in, 'Tamanho');
out = rmfield(temp_struct, 'Amostras');
