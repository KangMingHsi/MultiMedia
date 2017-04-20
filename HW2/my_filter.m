function [outputSignal, outputFilter] = my_filter(inputSignal, fsample, N, windowName, filterName, fcutoff)
%%% Input 
% inputSignal: input signal
% fsample: sampling frequency
% N : size of FIR filter(odd)
% windowName: 'Blackmann'
% filterName: 'low-pass', 'high-pass', 'bandpass', 'bandstop' 
% fcutoff: cut-off frequency or band frequencies
%       if type is 'low-pass' or 'high-pass', para has only one element         
%       if type is 'bandpass' or 'bandstop', para is a vector of 2 elements

%%% Ouput
% outputSignal: output (filtered) signal
% outputFilter: output filter 

%% 1. Normalization
fcutoff = (fcutoff / fsample);

%% 2. Create the filter according the ideal equations (slide #76)
% (Hint) Do the initialization for the outputFilter here
middle = round(N/2);
filterR = floor(N/2);
filterL = -filterR;
outputFilter = zeros(N, 1);

if strcmp(filterName, 'lowpass')
    for n = filterL : filterR
        if (n ~= 0) 
            outputFilter(n + middle) = sin(2*pi*fcutoff*n)/(pi*n);
        end
    end
    outputFilter(middle) = 2*fcutoff;
    
elseif strcmp(filterName, 'highpass')
    for n = filterL : filterR
        if (n ~= 0) 
            outputFilter(n + middle) = -sin(2*pi*fcutoff*n)/(pi*n);
        end
    end
    outputFilter(middle) = 1 - 2*fcutoff;
    
elseif strcmp(filterName, 'bandpass')
    
    for n = filterL : filterR
        if (n ~= 0) 
            outputFilter(n + middle) = sin(2*pi*fcutoff(2)*n)/(pi*n)-sin(2*pi*fcutoff(1)*n)/(pi*n);
        end
    end
    outputFilter(middle) = 2*(fcutoff(2) - fcutoff(1));
    
elseif strcmp(filterName, 'bandstop')
    
    for n = filterL : filterR
        if (n == 0) 
        	outputFilter(n + middle) = sin(2*pi*fcutoff(1)*n)/(pi*n)-sin(2*pi*fcutoff(2)*n)/(pi*n);
        end
    end
    outputFilter(middle) = 1 - 2*(fcutoff(2) - fcutoff(1));
end

%% 3. Create the windowing function (slide #80) and Get the realistic filter
if strcmp(windowName,'Blackmann')
	for n = 1:N
        outputFilter(n) = outputFilter(n) * (0.42 - 0.5*cos((2*pi*(n-1))/(N-1)) + 0.08 * cos(4*pi*(n-1)/(N-1)));
    end
end
%% 4. Filter the input signal in time domain. Do not use matlab function 'conv'
for i = 1:length(inputSignal)
    tmp = 0;
    for n = filterL : filterR
        if(i-n > 0 && i-n < length(inputSignal))
            tmp = tmp + inputSignal(i-n) * outputFilter(n+middle);
        end
    end
    outputSignal(i) = tmp;
end

%sum(abs((outputSignal / max(outputSignal)) - normalize_input) > 0.09)
