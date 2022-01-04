% ECE 503 HW 5 Problem 2
clearvars;
close all;
clc;

% Design appropriate Chebyshev filter order
fs = 8e3; % Hz
fp = 1.2e3; % Hz
fst = 2e3; % Hz
Rp = 0.5;
Rs = 40;

[nButter, WnButter] = buttord(fp/(fs/2), fst/(fs/2), Rp, Rs);
[nCheb, WnCheb] = cheb1ord(fp/(fs/2), fst/(fs/2), Rp, Rs);
[nEllip, WnEllip] = ellipord(fp/(fs/2), fst/(fs/2), Rp, Rs);





% Design appropriate FIR filter 
Rpass  = (10^(Rp/20) - 1)/(10^(Rp/20) + 1);
Rstop = 10^(-Rs/20);
NumMin = firgr('minorder',[0 fp/(fs/2) fst/(fs/2) 1], [1 1 0 0],[Rpass,Rstop]);
NOrder = length(NumMin)-1
