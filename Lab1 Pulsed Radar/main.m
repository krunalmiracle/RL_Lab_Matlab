clear;
pulse_width = 1e-6;
PRI = 5e-6;
frequency_carrier = 5e6;
peak_transmited_power = 1e6;
signal_losses = 3;
num_pulses = 5;
frequency_sampling = 100e6;
distance_to_target = 450;
%% 1.2 Range = 0m && 1.4 (Frequency spectrum)
 [ blind_range, unambiguous_range, PRF, range_resolution, duty_cycle, mean_received_power, pulse_energy, vector_pulse_voltage_burst_samples, vector_time_tags_pulse_burst_samples  ] = ...
    pulse_burst( pulse_width, PRI, frequency_carrier, peak_transmited_power, signal_losses, num_pulses, frequency_sampling, distance_to_target)

%% 1.3
%     clear; clc;
%     pulse_width = 1e-6;
%     PRI = 5e-6;
%     frequency_carrier = 5e6;
%     num_pulses = 5;
%     frequency_sampling = 100e6;
%     peak_transmited_power = 1e6;
% % Target specifications 
%     signal_losses_target_1 = 3; signal_losses_target_2 = 6;
%     distance_to_target_1 = 450; distance_to_target_2 = 1*1852; % Nautical mile to meters
%     [ blind_range_target_1, unambiguous_range_target_1, PRF_target_1, range_resolution_target_1, duty_cycle_target_1, mean_received_power_target_1, pulse_energy_target_1, vector_pulse_voltage_burst_samples_target_1, vector_time_tags_pulse_burst_samples_target_1  ] = pulse_burst( pulse_width, PRI, frequency_carrier, peak_transmited_power, signal_losses_target_1, num_pulses, frequency_sampling, distance_to_target_1)
%     [ blind_range_target_2, unambiguous_range_target_2, PRF_target_2, range_resolution_target_2, duty_cycle_target_2, mean_received_power_target_2, pulse_energy_target_2, vector_pulse_voltage_burst_samples_target_2, vector_time_tags_pulse_burst_samples_target_2  ] = pulse_burst( pulse_width, PRI, frequency_carrier, peak_transmited_power, signal_losses_target_2, num_pulses, frequency_sampling, distance_to_target_2)

%% 1.3 - Answer

% Is it possible to correctly find the range of both targets?

% En el caso de los 450 metros y 3db de atenuacion (losses) si que es
% detectable, encambio en el caso de 1852 metros >> Unambiguous range y 6 db de atenuacion no es
% posible porque hasta despues del tercer pulso no aparece. 

% In case that this won't be possible, suggest a solution to find the range
% without ambiguity.

% La forma de solucionar este problema es aumentando el PRI para que el
% intervalo entre pulsos sea mayor.
