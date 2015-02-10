function [ o ] = calc_variacao( x )
    maximo = max(x);
    minimo = min(x);

	o = maximo - minimo;