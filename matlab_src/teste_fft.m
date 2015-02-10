clear;
Fs = 33;                      % Sampling frequency
T = 1/Fs;                     % Sample time
L = 1000;                     % Length of signal
t = (0:L-1)*T;                % Time vector
% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
x = 0.7*sin(2*pi*10*t) + sin(2*pi*12*t); 
y = x + 2*randn(size(t));     % Sinusoids plus noise
%y = x;
N=512;


figure(2);
subplot(4,1,1);
yb = y(1:N);
w = hamming(N);
yb = yb.*w';
f=[];
fx=[];
[ f fx ] = calcula_fft(yb, Fs, N);
fx = fx(1:(N/2) +1);
plot(f, 2*abs(fx));

subplot(4,1,2);
yb = y(1:N);
w = blackman(N);
yb = yb.*w';
f=[];
fx=[];
[ f fx ] = calcula_fft(yb, Fs, N);
fx = fx(1:(N/2) +1);
plot(f, 2*abs(fx));

subplot(4,1,3);
yb = y(1:N);
w = hann(N);
yb = yb.*w';
f=[];
fx=[];
[ f fx ] = calcula_fft(yb, Fs, N);
fx = fx(1:(N/2) +1);
plot(f, 2*abs(fx));

subplot(4,1,4);
yb = y(1:N);
w = bartlett(N);
yb = yb.*w';
f=[];
fx=[];
[ f fx ] = calcula_fft(yb, Fs, N);
fx = fx(1:(N/2) +1);
plot(f, 2*abs(fx));