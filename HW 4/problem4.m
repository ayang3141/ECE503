% ECE 503 HW 4 Problem 4

clearvars;
close all;
clc;

% Low Pass Filter with cutoff frequency at pi/6
lpFilt = designfilt('lowpassfir','PassbandFrequency',0.16667, ...
         'StopbandFrequency',0.17,'PassbandRipple',0.01, ...
         'StopbandAttenuation',100,'DesignMethod','kaiserwin');
fvtool(lpFilt)




