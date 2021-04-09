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
    figure(1)
    title("Barker code 5");
    hold on
    plot(vector_time_5,real(vector_signal_without_noise_5));
    hold on
    plot(vector_time_5,real(vector_signal_with_noise_5));
    hold on
    legend("vector signal without noise 5", "Vector signal with noise 5");
    hold off
    % Barker code 7
    [vector_signal_without_noise_7, vector_noise_7, vector_signal_with_noise_7, vector_time_7, sampling_time_7] = baseband_signal(pulse_duration, samples_per_chip, vector_chip_phase_7, vector_chip_amplitudes, SNR);
    figure(2)
    title("Barker code 7");
    hold on
    plot(vector_time_7,real(vector_signal_without_noise_7));
    hold on
    plot(vector_time_7,real(vector_signal_with_noise_7));
    hold on
    legend("vector signal without noise 7", "Vector signal with noise 7");
    hold off
    % Barker code 11
    [vector_signal_without_noise_11, vector_noise_11, vector_signal_with_noise_11, vector_time_11, sampling_time_11] = baseband_signal(pulse_duration, samples_per_chip, vector_chip_phase_11, vector_chip_amplitudes, SNR);
    figure(3)
    title("Barker code 11");
    hold on
    plot(vector_time_11, real(vector_signal_without_noise_11));
    hold on
    plot(vector_time_11,real(vector_signal_with_noise_11));
    hold on
    legend("vector signal without noise 11", "Vector signal with noise 11");
    hold off
    % Barker code 13
    [vector_signal_without_noise_13, vector_noise_13, vector_signal_with_noise_13, vector_time_13, sampling_time_13] = baseband_signal(pulse_duration, samples_per_chip, vector_chip_phase_13, vector_chip_amplitudes, SNR);
    figure(4)
    title("Barker code 13");
    hold on
    plot(vector_time_13,real(vector_signal_without_noise_13));
    hold on
    plot(vector_time_13,real(vector_signal_with_noise_13));
    hold on
    legend("vector signal without noise 13", "Vector signal with noise 13");
    hold off
    % Comments------------------------------------
    %
    %------------------------------------------------
    %% Matched filter - 4.3
    % Barker code 5
        matched_filter_5 = conj(fliplr(vector_signal_without_noise_5));
        vector_signal_with_noise_output_5 = abs(conv(matched_filter_5, vector_signal_with_noise_5));
        figure(5)
        title("Linear convulation barker 5");
        hold on
            plot(rescale((0 : 1 :length(vector_signal_with_noise_output_5)-1), 0, pulse_duration) , vector_signal_with_noise_output_5);
        hold off
        figure(6)
        title("logarithmic convulation barker 5");
        hold on
            plot(rescale((0 : 1 :length(vector_signal_with_noise_output_5)-1), 0, pulse_duration) , 20*log10(vector_signal_with_noise_output_5));
        hold off
    %     vector_signal_without_noise_output_5 = conv(matched_filter_5, vector_signal_without_noise_5);
    %     figure(6)
    %         plot(rescale((0 : 1 :length(vector_signal_without_noise_output_5)-1),0,pulse_duration) , vector_signal_without_noise_output_5);
    % Barker code 7
        matched_filter_7 = conj(fliplr(vector_signal_without_noise_7));
        vector_signal_with_noise_output_7 = abs(conv(matched_filter_7, vector_signal_with_noise_7));
        figure(7)
        title("Linear convulation barker 7");
        hold on
            plot(rescale((0 : 1 :length(vector_signal_with_noise_output_7)-1), 0, pulse_duration) , vector_signal_with_noise_output_7);
        hold off
        figure(8)
        title("logarithmic convulation barker 7");
        hold on
            plot(rescale((0 : 1 :length(vector_signal_with_noise_output_7)-1), 0, pulse_duration) , 20*log10(vector_signal_with_noise_output_7));
        hold off   
     % Barker code 11
        matched_filter_11 = conj(fliplr(vector_signal_without_noise_11));
        vector_signal_with_noise_output_11 = abs(conv(matched_filter_11, vector_signal_with_noise_11));
        figure(9)
        title("Linear convulation barker 11");
        hold on
            plot(rescale((0 : 1 :length(vector_signal_with_noise_output_11)-1), 0, pulse_duration) , vector_signal_with_noise_output_11);
        hold off
        figure(10)
        title("logarithmic convulation barker 11");
        hold on
            plot(rescale((0 : 1 :length(vector_signal_with_noise_output_11)-1), 0, pulse_duration) , 20*log10(vector_signal_with_noise_output_11));
        hold off
      % Barker code 13
        matched_filter_13 = conj(fliplr(vector_signal_without_noise_13));
        vector_signal_with_noise_output_13 = abs(conv(matched_filter_13, vector_signal_with_noise_13));
        figure(11)
        title("Linear convulation barker 13");
        hold on
            plot(rescale((0 : 1 :length(vector_signal_with_noise_output_13)-1), 0, pulse_duration) , vector_signal_with_noise_output_13);
        hold off
        figure(12)
        title("logarithmic convulation barker 13");
        hold on
            plot(rescale((0 : 1 :length(vector_signal_with_noise_output_13)-1), 0, pulse_duration) , 20*log10(vector_signal_with_noise_output_13));
        hold off  
    %% 4.4     Make a linear plot of the matched filter output and the input signal for a Barker code of length K=13 when the SNR changes from 30 dB to -10 dB in steps of 10 dB. Make comments about the results (peak level, sidelobe level, peak width, ...).
        figure(13)
        title("Linear convulation barker 13 SNR changing from -10 to +30 db");
        hold on
        for(snr_changes = -10: 10 : 30 )
            % Barker code 13
            [vector_signal_without_noise_13_changes, vector_noise_13_changes, vector_signal_with_noise_13_changes, vector_time_13_changes, sampling_time_13_changes] = baseband_signal(pulse_duration, samples_per_chip, vector_chip_phase_13, vector_chip_amplitudes, snr_changes);
            % Barker code 13
            matched_filter_13_changes = conj(fliplr(vector_signal_without_noise_13_changes));
            vector_signal_with_noise_output_13_changes = abs(conv(matched_filter_13_changes, vector_signal_with_noise_13_changes));
            plot(rescale((0 : 1 :length(vector_signal_with_noise_output_13_changes)-1), 0, pulse_duration) , vector_signal_with_noise_output_13_changes);
            hold on
        end
        legend("-10dB", "0dB", "+10dB", "+20dB", "+30dB");
        hold off
    %% PART II - Robustness of the matched filter to non-expected Barker signals and Doppler shifts.
    
    
    
    
    
    
    
    
    