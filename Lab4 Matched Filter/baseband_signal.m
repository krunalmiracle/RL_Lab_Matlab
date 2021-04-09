function [vector_signal_without_noise, vector_noise, vector_signal_with_noise, vector_time, sampling_time]= baseband_signal(pulse_duration, samples_per_chip, vector_chip_phase, vector_chip_amplitudes, SNR)

%% Vector of signal
% Bandwidth = 1/sub_pulseTime
% Time*Bandwidth = pulse_time/sub_pulseTime

    vector_signal_without_noise=[];
    for i= 1: 1: length(vector_chip_phase)
        if vector_chip_phase(i)==0
        b=ones(1,samples_per_chip)*vector_chip_amplitudes;
        else
        b=-1*ones(1,samples_per_chip)*vector_chip_amplitudes;
        end
        vector_signal_without_noise=[vector_signal_without_noise,b];
    end
%% Time vector
    vector_time = rescale((0 : 1 :length(vector_signal_without_noise)-1),0,pulse_duration);

%% Noise
vector_noise_before_snr = randn(1,length(vector_signal_without_noise))+1i*randn(1,length(vector_signal_without_noise)); 

%% SNR to Signal/Noise vector correction
    Ps = sum(abs(vector_noise_before_snr).^2);
    snr=10^(SNR/10);
    power_noise=Ps/snr;
    power_noise_before_snr=sum(abs(vector_noise_before_snr).^2);
    vector_noise=vector_noise_before_snr*sqrt(power_noise/power_noise_before_snr);

%% Baseband signal with noise
    vector_signal_with_noise=vector_signal_without_noise+vector_noise;
    % Signal with time
    figure(1)
        plot(vector_time, vector_signal_with_noise);
        
%% Sampling time
sampling_time = pulse_duration/samples_per_chip;
end
