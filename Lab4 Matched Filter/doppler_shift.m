function [vector_signal_with_dopplershift_noise] = doppler_shift(vector_signal_with_noise, pulse_duration, frequency_carrier, velocity_radial, samples_per_chip)
%DOPPLER_SHIFT Adds the Doppler frequency shift to the (noisy) received signal sn(t) by doing: sn(t)·exp(j 2pi·f0·2vr/c t)
    c = 3e8; % Light speed [m/s]
    vector_signal_with_dopplershift_noise = zeros(1,length(vector_signal_with_noise));
    n = 1;
    while (n <= length(vector_signal_with_dopplershift_noise))
        vector_signal_with_dopplershift_noise(1,n) = vector_signal_with_noise(1,n)*exp(1i*2*pi*frequency_carrier*2*(velocity_radial/c)* n*pulse_duration/samples_per_chip);
        n = n+1;
    end
end

