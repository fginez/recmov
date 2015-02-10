function Hd = low_pass_hamming
%LOW_PASS_HAMMING Returns a discrete-time filter object.

%
% MATLAB Code
% Generated by MATLAB(R) 7.12 and the DSP System Toolbox 8.0.
%
% Generated on: 20-Aug-2012 21:57:48
%

% FIR Window Lowpass filter designed using the FIR1 function.

% All frequency values are in Hz.
Fs = 33;  % Sampling Frequency

N    = 64;       % Order
Fc   = 0.3;      % Cutoff Frequency
flag = 'scale';  % Sampling Flag

% Create the window vector for the design algorithm.
win = hamming(N+1);

% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Fc/(Fs/2), 'low', win, flag);
Hd = dfilt.dffir(b);

% [EOF]
