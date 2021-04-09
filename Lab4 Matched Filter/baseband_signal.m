function [vector_signal_without_noise, vector_noise, vector_signal_with_noise, vector_time, sampling_time]= baseband_signal(pulse_duration, samples_per_chip, vector_chip_phase, vector_chip_amplitudes, SNR)
%% Sampling time
nSamples = samples_per_chip*length(vector_chip_phase);
sampling_time = pulse_duration/nSamples;

    %% Get the pulse signal, with the chips and their corresponding phase
vector_signal_without_noise = zeros(1,nSamples); % We first create the length of the array
for n=1:length(vector_chip_phase)
   for i=1:samples_per_chip
       if(vector_chip_phase(n) == 180)
          % We put in every sample the value of the chip the sample is in 
          vector_signal_without_noise((n-1)*samples_per_chip+i) = -1*vector_chip_amplitudes; 
       elseif(vector_chip_phase(n) == 0)
          % We put in every sample the value of the chip the sample is in 
          vector_signal_without_noise((n-1)*samples_per_chip+i) = 1*vector_chip_amplitudes; 
       end
   end
end
%% Time vector
    vector_time = rescale((0 : 1 :length(vector_signal_without_noise)-1),0,pulse_duration);

%% Noise - SNR to Signal/Noise vector correction
    %Ps = sum(vector_noise_before_snr.^2);
    SNR=10^(SNR/20);
    % Create the noise vector
    vector_noise = randn(1,nSamples)+ 1i*randn(1,nSamples);
    % Get the amplitude factor that we have to multiply for in noiseArray
    vector_noise = vector_noise/SNR;
%% Baseband signal with noise
    vector_signal_with_noise = vector_signal_without_noise+vector_noise;
end
