function Hd = fpf_bw_03_15
%FPF_BW_03_15 Returns a discrete-time filter object.

%
% MATLAB Code
% Generated by MATLAB(R) 7.12 and the DSP System Toolbox 8.0.
%
% Generated on: 28-Aug-2012 07:13:07
%

% Butterworth Bandpass filter designed using FDESIGN.BANDPASS.

% All frequency values are in Hz.
Fs = 33;  % Sampling Frequency

N   = 4;    % Order
Fc1 = 0.3;  % First Cutoff Frequency
Fc2 = 15;   % Second Cutoff Frequency

% Construct an FDESIGN object and call its BUTTER method.
h  = fdesign.bandpass('N,F3dB1,F3dB2', N, Fc1, Fc2, Fs);
Hd = design(h, 'butter');

% [EOF]
