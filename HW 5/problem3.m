% ECE 503 HW 5 Problem 3
clearvars;
close all;
clc;

sps = 256;

eegData = load('eeg.txt');
wt = cwt(eegData);

N = length(wt(:,1));
M = length(wt(1,:));
freqs = zeros(1, N);

for i = 1:N
   currFFT = wt(i,:);
   maxMag = 0;
   maxFreq = 0;
   
   for j = 1:M
       currMag = abs(currFFT(j));
       if(currMag > maxMag)
          maxMag = currMag;
          maxFreq = j*(sps/2)/M;
       end
   end
    mags(i) = maxMag;
    freqs(i) = maxFreq;
    
end

stem((1:1:N), freqs);
xlabel('n');
ylabel('Predominant Frequencies (Hz)');