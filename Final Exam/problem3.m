% ECE 503 Final Exam Problem 3

clear all
close all;
clc;


load signalA.txt;
load signalB.txt;

sigA = signalA;
sigB = signalB;


%% CHECK AMPLTIUDE OF SIGNALS
figure(1)
subplot(211);
plot(1:length(sigA), abs(sigA));
hold on
subplot(212);
plot(1:length(sigB), abs(sigB));
hold off




%% CHECK PHASE
figure(2)
subplot(211);
plot(1:length(sigA), angle(sigA));
hold on
subplot(212);
plot(1:length(sigB), angle(sigB));
hold off




%% CHECK MEAN
meanA = mean(sigA)
meanB = mean(sigB)




%% CHECK VARIANCE
varianceA = var(sigA)
varianceB = var(sigB)





%% CHECK POWER SPECTRAL DENSITY

sigA = sigA(1:3000);
sigB = sigB(1:3000);


% 30 intervals with size 100 each
fftSize = 100;
numIntervals = length(sigA)/(fftSize);

autoCorrA = zeros(fftSize, 1);
autoCorrB = zeros(fftSize, 1);


for i = 0:numIntervals-1
    currentWindowA = sigA(fftSize*i+1 : fftSize*(i+1));
    currentWindowB = sigB(fftSize*i+1 : fftSize*(i+1));
    currAutoCorrA = autocorr(currentWindowA, fftSize-1);
    currAutoCorrB = autocorr(currentWindowB, fftSize-1);
    autoCorrA = autoCorrA + currAutoCorrA;
    autoCorrB = autoCorrB + currAutoCorrB;
end

autoCorrA = autoCorrA/numIntervals;
autoCorrB = autoCorrB/numIntervals;

PSD_A = fft(autoCorrA, 4096);
PSD_B = fft(autoCorrB, 4096);



figure(3)
subplot(211);
plot(1:length(PSD_A), abs(PSD_A));
subplot(212);
plot(1:length(PSD_B), abs(PSD_B));

%% CHECK POWER SPECTRUM
figure(4);
pspectrum(sigA, 'Leakage', 1)
legend('Signal A');
figure(5);
pspectrum(sigB, 'Leakage', 1)
legend('Signal B');


% The higher frequencies of the power spectrum of signal B appear to be
% "synthetic" since there is a lack of randomness and is generally
% "well-structured". This suggests that the signal B is the surrogate
% signal. 















