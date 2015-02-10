function [f, mag] = calc_max_f (x)

    % calcula a fft
    [f_x X] = calc_fft(x, 33, 128);
    
    magX = [];
    magX = 2.*abs(X).^2;
    
    magX = magX(3:length(magX)/2+1);
    
    [mag f] = max(magX);
    f=f+2;
    