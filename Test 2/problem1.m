% ECE 503 TEST 2 PROBLEM 1

clearvars;
close all;
clc;

sensorData = readtable('ACC.csv');
X = sensorData.Var1(3:end);    
Y = sensorData.Var2(3:end);    
Z = sensorData.Var3(3:end);    

%% PART A: AUTOCORRELATION FUNCTIONS
figure(1);
subplot(311);
autocorr(X, 'NumLags', 100);
title('Autocorrelation function for X');
hold on
subplot(312);
autocorr(Y, 'NumLags', 100);
title('Autocorrelation function for Y');
hold on
subplot(313);
autocorr(Z, 'NumLags', 100);
title('Autocorrelation function for Z');
hold off

%% PART B: CROSS-CORRELATION FUNCTIONS
figure(2);
subplot(311);
[r1,lags1] = xcorr(X, Y, 20, 'normalized');
stem(lags1, r1);
title('Cross-correlation function for X and Y');
xlabel('Lag');
ylabel('Cross-correlation Normalized');

subplot(312);
[r2,lags2] = xcorr(Y, Z, 20, 'normalized');
stem(lags2, r2)
title('Cross-correlation function for Y and Z');
xlabel('Lag');
ylabel('Cross-correlation Normalized');

subplot(313);
[r3,lags3] = xcorr(X, Z, 20, 'normalized');
stem(lags3, r3);
title('Cross-correlation function for X and Z');
xlabel('Lag');
ylabel('Cross-correlation Normalized');






