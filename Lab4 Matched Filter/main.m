clear all
close all
clc
%% Barker codes
    vector_chip_phase_5=[0 0 0 180 0];

    vector_chip_phase_7=[0 0 0 180 180 0 180];

    vector_chip_phase_11=[0 0 0 180 180 180 0 180 180 0 180];
    
    vector_chip_phase_13=[0 0 0 0 0 180 180 0 0 180 0 180 0];
%% 4.2 Make a pulse burst
    pulse_duration = 1e-6; 
    samples_per_chip = 20;
    SNR=30; % db
    vector_chip_amplitudes = 10; % Just a peak amplitude
    % Barker code 5
    [vector_signal_without_noise_5, vector_noise_5, vector_signal_with_noise_5, vector_time_5, sampling_time_5] = baseband_signal(pulse_duration, samples_per_chip, vector_chip_phase_5, vector_chip_amplitudes, SNR);
     % Barker code 7
    [vector_signal_without_noise_7, vector_noise_7, vector_signal_with_noise_7, vector_time_7, sampling_time_7] = baseband_signal(pulse_duration, samples_per_chip, vector_chip_phase_7, vector_chip_amplitudes, SNR);
     % Barker code 11
    [vector_signal_without_noise_11, vector_noise_11, vector_signal_with_noise_11, vector_time_11, sampling_time_11] = baseband_signal(pulse_duration, samples_per_chip, vector_chip_phase_11, vector_chip_amplitudes, SNR);
     % Barker code 13
    [vector_signal_without_noise_13, vector_noise_13, vector_signal_with_noise_13, vector_time_13, sampling_time_13] = baseband_signal(pulse_duration, samples_per_chip, vector_chip_phase_13, vector_chip_amplitudes, SNR);
    % Comments------------------------------------
    %
    %------------------------------------------------
    %% Matched filter - 4.3
    % Barker code 5
    matched_filter = conj(fliplr(vector_signal_without_noise));
    vector_signal_with_noise_output = conv(matched_filter, vector_signal_with_noise);
    figure(2)
        plot(rescale((0 : 1 :length(vector_signal_with_noise_output)-1),0,pulse_duration) , vector_signal_with_noise_output);
    vector_signal_without_noise_output = conv(matched_filter, vector_signal_without_noise);
    figure(3)
        plot(rescale((0 : 1 :length(vector_signal_without_noise_output)-1),0,pulse_duration) , vector_signal_without_noise_output);
    % Barker code 7
    
     % Barker code 11
     
      % Barker code 13
      
        
        