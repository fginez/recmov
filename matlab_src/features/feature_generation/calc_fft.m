%TODO: Inserir um sinal de teste e ver se a função está adequada!
%      O sinal de teste pode ser doa site da mathworks

function [f, fx] = calc_fft(sinal, fa, N)

	fx = fft(sinal,N)/N;
	f  = fa / 2 * linspace (0, 1, N/2 + 1);

%to plot a single-sided fft
%plot(f, 2*abs(fx(1:N/2 + 1)));

% help here
%http://www.mathworks.com/support/tech-notes/1700/1702.html
