% ECE 503 Final Exam Problem 4

clear all;
close all;
clc;

load stemp.txt;


fs = 100; % Test Sampling Frequency
t = 0:1/fs:3.99; % time vector

tempSignal = stemp;
avgValue = mean(tempSignal); % Calculate mean signal value
tempSignal = tempSignal - avgValue; % shift signal to have mean 0

% Finds hilbert transform of signal
ts_hilbert = hilbert(tempSignal);

% plot real and imaginary parts of the analytic signal
figure(1);
plot(t,real(ts_hilbert),t,imag(ts_hilbert));
legend('real','imaginary');
title('Hilbert Transformation');
xlabel('Time (s)');
ylabel('Magnitude');


%% CALCULATE POWER DENSITY SPECTRUM
[pxx, f] = pwelch(ts_hilbert,4,0,[],fs,'centered');
figure(2);
plot(f, 10*log10(pxx));
xlabel('Frequency (Hz)');
ylabel('PSD (dB/Hz)');



%% CREATE PERIODIC SINUSOIDAL COMPONENT


maxPower = 0;
maxFreq = 0;
for i = 1:length(pxx)
    currPower = pxx(i);
    if(currPower > maxPower)
       maxPower = currPower;
       maxFreq = f(i);
    end
end

% Although most dominant frequency maxFreq is 5.8594, it was determined
% that the frequency 6.6 was a better representation
maxFreqChosen = 6.6;
sineSignalComp = (sin(maxFreqChosen*t - pi/4)).';

figure(3);
subplot(211);
plot(t, tempSignal, t, sineSignalComp);
legend('Original Temp Signal', 'Sine Wave Component');
xlabel('Time (s)');
ylabel('Degrees Celsius');
subplot(212);
plot(t, tempSignal-sineSignalComp);
legend('Resulting Difference Signal');
xlabel('Time (s)');
ylabel('Degrees Celsius');




%% FIND THE SECOND ORDER AUTOREGRESSIVE MODEL
noise = tempSignal - sineSignalComp;
AR_model = ar(noise, 2, 'Ts', 1/fs);
phi1 = AR_model.A(2);
phi2 = AR_model.A(3);

% The AR(2) model is described as follows:
% A(z)y(t) = e(t)
% where A(z) is the autoregressive characteristic polynomial
%       y(t) is the time-domain signal being regressed on
%       e(t) is the generated disturbance used to start the model

AR_signal = zeros(length(noise), 1);
AR_signal(1) = 0.4*randn;
AR_signal(2) = 0.4*randn;

for i = 3:length(AR_signal)
   AR_signal(i) = -phi1*AR_signal(i-1) - phi2*AR_signal(i-2) + 0.4*randn;
end


figure(4)
plot(t, noise, t, AR_signal);
legend('Original Noise', 'AR(2) Model');
xlabel('Time (s)');
ylabel('Degrees Celsius');


%% COMPARE SIGNAL-PLUS-NOISE MODEL WITH ACTUAL TEMP SIGNAL

SinePlusAR_Signal = sineSignalComp + avgValue + AR_signal;
figure(5)
plot(t, stemp, t, SinePlusAR_Signal);
legend('Original Temp Signal', 'AR(2) Model');
xlabel('Time (s)');
ylabel('Degrees Celsius');













