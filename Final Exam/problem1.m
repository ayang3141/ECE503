% ECE 503 Final Exam Problem 1

clear all;
close all;
clc;

load sp.txt;
load sr.txt;

RR_signal = sr; % nonconstant sampling
resp_signal = sp; % constant sampling

% Resampling Time Interval
fs = 100;
newTime = (1004:1/fs:3499.9);

% Resample RR signal (using fs = 100)
RR_tSeries = timeseries(RR_signal(:,2), RR_signal(:,1));
tsout1 = resample(RR_tSeries, newTime);
RR_signal_rs = tsout1.Data;

% Resample resp signal (using fs = 100)
resp_tSeries = timeseries(resp_signal(:,2), resp_signal(:,1));
tsout2 = resample(resp_tSeries, newTime);
resp_signal_rs = tsout2.Data;


%% PART A
% FIND COHERENCE 
[cxy, f] = mscohere(RR_signal_rs, resp_signal_rs, fs);

figure(1)
plot(f, cxy);
ylim([0 1]);
xlabel('Frequency (Hz)');
ylabel('Coherence');


maxCohere = 0;
maxFreq = 0;
for i=1:length(f)
    currCohere = 0;
    if((f(i) >= 0.7) & (f(i) <= 1.5))
       currCohere = cxy(i); 
    end
    
    if(currCohere > maxCohere)
       maxCohere = currCohere;
       maxFreq = f(i);
    end
end


fprintf('Max coherence is %5.4f at frequency %5.4f\n', maxCohere, maxFreq)
% Coherence does NOT stay level during the entire time of the recording

%% PART B

% Predominant Amplitude and Frequency

% 813 intervals with size 307 each
fftSize = 307;
numIntervals = length(RR_signal_rs)/(fftSize);

RR_STFTmag = zeros(numIntervals, 1);
RR_STFTfreq = zeros(numIntervals, 1);

resp_STFTmag = zeros(numIntervals, 1);
resp_STFTfreq = zeros(numIntervals, 1);

n = 0:1:numIntervals-1;
N = 4096;
for i = 0:numIntervals-1
    RR_currentWindow = RR_signal_rs(fftSize*i+1 : fftSize*(i+1));
    RR_currFFT = fft(RR_currentWindow, N);
    resp_currentWindow = resp_signal_rs(fftSize*i+1 : fftSize*(i+1));
    resp_currFFT = fft(resp_currentWindow, N);
    
    RR_maxMag = 0;
    RR_maxFreq = 0;
    resp_maxMag = 0;
    resp_maxFreq = 0;
    
    for j = 1:N/2
       RR_currMag = abs(RR_currFFT(j+N/2));
       resp_currMag = abs(resp_currFFT(j+N/2));
       
       
       if(RR_currMag > RR_maxMag)
          RR_maxMag = RR_currMag;
          RR_maxFreq = j*(fs/2)/(N/2);
       end 
       
       if(resp_currMag > resp_maxMag)
           resp_maxMag = resp_currMag;
           resp_maxFreq = j*(fs/2)/(N/2);
       end
       
    end
    RR_STFTmag(i+1) = RR_maxMag;
    RR_STFTfreq(i+1) = RR_maxFreq;
    
    resp_STFTmag(i+1) = resp_maxMag;
    resp_STFTfreq(i+1) = resp_maxFreq;

end

figure(1);
subplot(211);
plot(RR_STFTmag);
xlabel('n');
ylabel('Predominant Magnitude for RR Signal');
subplot(212);
plot(RR_STFTfreq);
xlabel('n');
ylabel('Predominant Frequency for RR Signal');

figure(2);
subplot(211);
plot(resp_STFTmag);
xlabel('n');
ylabel('Predominant Magnitude for Respiratory Signal');
subplot(212);
plot(resp_STFTfreq);
xlabel('n');
ylabel('Predominant Frequency for Respiratory Signal');


















