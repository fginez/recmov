function [ xy xz yz ] = calc_corr(x,y,z)

    [r xy] = corr(x,y);
    [r xz] = corr(x,z);
    [r yz] = corr(y,z);