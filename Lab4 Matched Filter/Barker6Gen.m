
function [] = Barker6Gen(Tchip,samples_per_chip)

    ampsBarker6 = ones(1,6); % Barker 6 code amplitude array
    nSamples = samples_per_chip*length(ampsBarker6); % Num samples per chip multiplied by the number of chips. In this case, it is a Barker 6


    j=1;
    figure(16);
    while(j <= 63)
       phasesBarker6 = de2bi(j,6,'left-msb')*180; % Barker 4 code phases array

       outSignal = zeros(1,nSamples); % We first create the length of the array
        for n=1:length(phasesBarker6)
           for i=1:samples_per_chip
               if(phasesBarker6(n) == 180)
                  % We put in every sample the value of the chip the sample is in 
                  outSignal((n-1)*samples_per_chip+i) = -1*ampsBarker6(n); 
               elseif(phasesBarker6(n) == 0)
                  % We put in every sample the value of the chip the sample is in 
                  outSignal((n-1)*samples_per_chip+i) = 1*ampsBarker6(n); 
               end
           end
        end

        filterOutput6 = abs(conv(outSignal, fliplr(conj(outSignal))));

        pks = findpeaks(filterOutput6);
        a=1;

        % UNCOMMENT TO PLOT ALL THE SIGNALS
        plot(filterOutput6, 'DisplayName', 'K = 6'); 
    %     legend;
        title('Output of matched filter (30 dB) K = 6');
        xlabel('Delay [n*sampleTime]');
        ylabel('Amplitude [linear]');
        hold on

        j = j+1;

    end
    
end