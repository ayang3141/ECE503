% ECE 503 HW 4 Problem 2

clearvars;
close all;
clc;

% -3 + 19z^-2 + 32z^-3 + 19z^-4 -3z^-6
Hz = [-3 0 19 32 19 0 -3];


[h, w] = freqz(Hz, 1, 10);

nd = 1:1:length(h);

figure(1);
stem(nd, angle(h));
xlabel("Frequency");
ylabel("Phase");



