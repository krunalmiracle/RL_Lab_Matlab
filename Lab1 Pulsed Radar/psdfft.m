function [freqAxis, signal_fft]=psdfft(title_fft, Fs, y, length_time)
%% Two sided centered at zero fft
freqAxis = [-length_time/2:(length_time-1)/2]*Fs/length_time;
signal_fft = fftshift(abs(fft(y)));
figure
title(title_fft);
hold on
plot(freqAxis,signal_fft);
hold off
%% One sided Fft
%   L=length(y);
%   NFFT = 2^nextpow2(L);
%   Y = fft(y,NFFT)/L;
%   f = Fs/2*linspace(0,1,NFFT/2+1);
%   psd=2*abs(Y(1:NFFT/2+1));
%     plot(f,psd) 
%     title('Single-Sided Amplitude Spectrum of y(t)')
%     xlabel('Frequency (Hz)')
%     ylabel('|Y(f)|')
end