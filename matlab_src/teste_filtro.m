
Fs = 33;                      % Sampling frequency
T = 1/Fs;                     % Sample time
L = 128;                     % Length of signal
t = (0:L-1)*T;                % Time vector
% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
%x = 0.2 + 0.7*sin(2*pi*0.5*t) + sin(2*pi*5*t); 
x = 0.2 + sin(2*pi*5*t); 

subplot(311);
x = x(1:128);
plot(x);

w = hamming(L);

xf=filter(Num,1,x);

subplot(312);
plot(xf);

x=x-xf;

subplot(313);
plot(x);