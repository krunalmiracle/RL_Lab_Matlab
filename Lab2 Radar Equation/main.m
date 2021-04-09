close all; clear all; clc;

%2.2
%input data
Pt = 1.5E6*2;
G = 45;
f = 5.6E9;
B = 5E6;
NF = 3;
L = -3;
A = 1;
R = 1000*(20:200);

SNR1 = snr_monostatic_radar(Pt/2,G,f,B,NF,L,A,R);

 figure(1)
 plot(R/1000,SNR1,'LineWidth',2);
 grid on
 xlabel('Range [km]');
 ylabel('SNR [-]');

figure(2)
SNR1dB = 10*log10(SNR1);
semilogx(R/1000,SNR1dB,'LineWidth',2);
grid on
% hold on
% SNR1 = snr_monostatic_radar(Pt/2,G,f,B,NF,L,A,R);
% SNR1dB = log10(SNR1);
% semilogx(R/1000,SNR1dB,'LineWidth',2);
% legend()
xlabel('Range [km]');
ylabel('SNR [dB]');

%2.3
figure(3)
AdB = [0,-10,-20];
for i=1:length(AdB)
    A2 = 10^(AdB(i)/10);
    SNR2 = snr_monostatic_radar(Pt,G,f,B,NF,L,A2,R);
    SNR2dB = log10(SNR2);
    semilogx(R/1000,SNR2dB,'LineWidth',2);
    hold on
    strlegend(i) = "Radar" + i +": cross section = " + AdB(i) + " dBm2";
end
xlabel('Range [km]');
ylabel('SNR [dB]');
grid on
legend(strlegend);

%2.4
figure(4)
for i=0:3:6
    Ptnew = Pt*10^(i/10); 
    SNR3 = snr_monostatic_radar(Ptnew,G,f,B,NF,L,A,R);
    SNR3dB = log10(SNR3);
    semilogx(R/1000,SNR3dB,'LineWidth',2);
    strlegend(i/3 + 1) = "Pt(dBW) + " + i +"dB";
    hold on
end
xlabel('Range [km]');
ylabel('SNR [dB]');
grid on
legend(strlegend);

%2.5
figure(5)
semilogx(R/1000,SNR1dB,'LineWidth',2);
hold on
L5 = 10; %[dB]
SNR5 = snr_monostatic_radar(Pt,G,f,B,NF,L5,A,R);
SNR5dB = log10(SNR5);
semilogx(R/1000,SNR5dB,'LineWidth',2);
grid on
xlabel('Range [km]');
ylabel('SNR [dB]');
legend("Additional losses = 0 dB", "Additional losses = " + L5 + " dB");
