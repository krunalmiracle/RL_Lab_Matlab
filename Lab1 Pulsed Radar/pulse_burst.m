function [ blind_range, unambiguous_range, PRF, range_resolution, duty_cycle, mean_received_power, pulse_energy, vector_pulse_voltage_burst_samples, vector_time_tags_pulse_burst_samples  ] = ...
    pulse_burst( pulse_width, PRI, frequency_carrier, peak_transmited_power, signal_losses, num_pulses, frequency_sampling, distance_to_target)
% pulse_burst  Plots a pulse burst modulating a RF carrier arriving to radar(50 Ohms).
%   [ blind_range, unambiguous_range, PRF, range_resolution, duty_cicle, mean_received_power, pulse_energy, output_amplitude_vector_burst,modulated_amplitude_vector_burst,...
%    output_amplitude_vector_burst_reflected,modulated_amplitude_vector_burst_reflected, timetags, timetags_reflected  ] = ...
%    pulse_burst( pulse_width, PRI, fc, mean_transmited_power, signal_losses, num_pulses, fs, distance_to_target)
%
%% Pulse width = tau0; PRT = PRI; 
%% Constants
c = 3e8;
%% Blind Range - Minimum range (Rciega)
blind_range = pulse_width * c / 2;

%% Pulse Repetition Frequency and Pulse repetition Interval
PRF = 1/PRI;
%% Unambiguous Range Rmax
unambiguous_range = c / (2*PRF);
%% Range resolution - (DeltaR) 
range_resolution = pulse_width * c / 2;

%% Duty cycle tau0 / T(period)
duty_cycle = pulse_width / PRI;

%% Average Transmitted power - Mean transmitted power
mean_transmited_power = peak_transmited_power*pulse_width/PRI; 

%% Linear Transmitted power
mean_transmited_power_lineal = 10^(mean_transmited_power/10);

%% Recieved peak Power & average RX power due to losses
peak_recieved_power = peak_transmited_power*10^(-signal_losses/10);
mean_received_power = mean_transmited_power*10^(-signal_losses/10);

%% Pulse energy
pulse_energy = peak_transmited_power*pulse_width;

%% Vector having the pulse voltWage burst samples [V]
    % Singular time vector for single pulse
    t=(0:1/frequency_sampling:PRI-1/frequency_sampling);
    % Vector of sine voltage at Frequency carrier with peak recieved power at target
    vector_sine_voltage= sin(2*pi*frequency_carrier*t);
    % Square pulse sent at target
    vector_pulse_voltage=(pulse_width>t);
    % Sampled singular square at carier frequency
    vector_pulse_voltage_sample=vector_sine_voltage.*vector_pulse_voltage;
    % Vector pulse of voltages with N number of pulses sampled as Frequency of sampling
    vector_pulse_voltage_burst = reshape(repmat(vector_pulse_voltage,1,num_pulses),1,num_pulses*length(t)).*peak_transmited_power; 
    vector_pulse_voltage_burst_samples_normalized = reshape(repmat(vector_pulse_voltage_sample,1,num_pulses),1,num_pulses*length(t)); 
    vector_pulse_voltage_burst_samples = vector_pulse_voltage_burst_samples_normalized.*peak_transmited_power;

%% Vector having the time tags corresponding to the pulse burst samples [s]
vector_time_tags_pulse_burst_samples = (0:1/frequency_sampling:num_pulses*PRI-(1/frequency_sampling));

%% Reflected received power back with delay due to range
    delay = 2 * distance_to_target / c;
    vector_time_tags_pulse_burst_samples_reflected = (0:1/frequency_sampling: num_pulses*PRI-(1/frequency_sampling) +delay );
    delay_length = length(vector_time_tags_pulse_burst_samples_reflected)- length(vector_time_tags_pulse_burst_samples);
    vector_pulse_voltage_burst_samples_attenuated = vector_pulse_voltage_burst_samples_normalized.*peak_recieved_power;
    vector_pulse_voltage_burst_samples_reflected = [zeros(1,delay_length) vector_pulse_voltage_burst_samples_attenuated];
%% Plot transmitted pulse and reflected pulse
    figure
    title("Transmitted pulse and reflected pulse")
    hold on
    plot(vector_time_tags_pulse_burst_samples,vector_pulse_voltage_burst_samples);
    hold on
    plot(vector_time_tags_pulse_burst_samples_reflected,vector_pulse_voltage_burst_samples_reflected);
    hold on
    legend("Transmitted pulse voltage", "Reflected pulse voltage");
    hold off
    % vector_pulse = vector_pulse_voltage_burst_samples_reflected + [vector_pulse_voltage_burst_samples zeros(1,delay_length)];
    % figure
    % plot(vector_time_tags_pulse_burst_samples_reflected,vector_pulse);
%% FFT --> frequency spectrum of the signal
%     [f1,s1] = psdfft("Unmodulated single pulse", frequency_sampling, vector_pulse_voltage, length(t));
%     
%     [f2,s2] = psdfft("Unmodulated pulse burst", frequency_sampling, vector_pulse_voltage_burst, length(vector_time_tags_pulse_burst_samples));
%     
%     [f3,s3] = psdfft("Modulated pulse burst", frequency_sampling, vector_pulse_voltage_burst_samples, length(vector_time_tags_pulse_burst_samples));
%     figure
%     title("Frequency spectrum of the signal")
%     hold on
%     plot(f1,s1);
%     hold on
%     plot(f2,s2);
%     hold on
%     plot(f3,s3);
%     hold on
%     legend("Unmodulated single pulse", "Unmodulated pulse burst", "Modulated pulse burst");
%     hold off
end