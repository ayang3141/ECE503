% ECE 503 TEST 2 PROBLEM 2


clearvars;
close all;
clc;

fs = 100; % sampling frequency in Hz
fc1 = 0.7;
fc2 = 1.5;

spData = load('sp.txt', 'Whitespace', ' ');
signal = spData(1:250000,2);

% Design passband filter with [0.7Hz, 1.5Hz] and apply filter to signal
filtSignal = bandpass(signal, [fc1/(fs/2) fc2/(fs/2)], fs);


m = length(filtSignal)/(fs*10);
STFTmag = zeros(m, 1);
STFTfreq = zeros(m, 1);
n = 0:1:m-1;
for i = 0:m-1
    currentWindow = filtSignal(10*fs*i+1 : 10*fs*(i+1));
    currFFT = fft(currentWindow, 1024);

    maxMag = 0;
    maxFreq = 0;
    for j = 1:1024
       currMag = abs(currFFT(j));
       if(currMag > maxMag)
          maxMag = currMag;
          maxFreq = j*(fs/2)/1024;
       end 
    end
    STFTmag(i+1) = maxMag;
    STFTfreq(i+1) = maxFreq;

end

figure(1);
stem(n, STFTmag);
xlabel('n');
ylabel('Magnitude');

