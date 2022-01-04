% ECE 503 HW 4 Problem 1

clearvars;
close all;
clc;

sps = 256; % samples per second


% PART A
eegData = load('eeg.txt');

fsamp = sps;
fcuts = [0.01 1 35 40];
mags = [0 1 0];
devs = [0.01 0.05 0.01];

[n,Wn,beta,ftype] = kaiserord(fcuts,mags,devs,fsamp);
n = n + rem(n,2);
bpFilt = fir1(n,Wn,ftype,kaiser(n+1,beta),'noscale');

fvtool(bpFilt)

filtEEGsignal = filter(bpFilt, 1, eegData); 




% PART B
m = length(filtEEGsignal)/(sps*4);
STFTmag = zeros(1, m);
STFTfreq = zeros(1, m);
n = 0:1:m-1;
for i = 0:m-1
    currentWindow = filtEEGsignal(4*sps*i+1 : 4*sps*(i+1));
    currFFT = fft(currentWindow, 2048);
    
%     figure(1);
%     stem((1:1:2048), abs(currFFT));
%     xlabel('n');
%     ylabel('Magnitude');
%     
    maxMag = 0;
    maxFreq = 0;
    for j = 1:length(currFFT(1001:2048))
       currMag = abs(currFFT(j));
       if(currMag > maxMag)
          maxMag = currMag;
          maxFreq = j*(sps/2)/1024;
       end 
    end
    STFTmag(i+1) = maxMag;
    STFTfreq(i+1) = maxFreq;

end

figure(1);
subplot(211);
stem(n, STFTmag);
xlabel('n');
ylabel('Magnitude');

subplot(212);
stem(n, STFTfreq);
xlabel('n');
ylabel('Frequency (Hz)');










