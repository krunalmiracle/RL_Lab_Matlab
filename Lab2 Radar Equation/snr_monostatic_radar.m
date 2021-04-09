function [SNR] = snr_monostatic_radar(peak_power, antenna_gain, frequency_carrier, bandwidth,noise_figure, additional_losses, radar_cross_section_A,array_ranges)
%Pt: peak powe [W]
%G: antenna gain [dBi]
%f: carrier frequency [Hz]
%B: bandwidth [dB]
%NF: noise figure [dB]
%L: additional losses [dB]
%A: radar cross section [m2]
%R: array of target ranges [m]
%SNR: array of SNR [dB]
%% Constants
c = 3E8;
k = 1.38064852e-23;
To = 290;
%% Calculations
Nin = k*To*bandwidth;
lambda = c/frequency_carrier;
Aef = lambda^2*antenna_gain/(4*pi);
F = 10^(noise_figure/10);
G = 10^(antenna_gain/10);
L = 10^(additional_losses/10);
SNR = (peak_power*(1/L)*G*Aef*radar_cross_section_A)./((4*pi)^2*Nin*F*array_ranges.^4);
end

