% ECE 503 HW 5 Problem 1
clearvars;
close all;
clc;

% Design appropriate Chebyshev filter order
Wp = 0.3;
Ws = 0.35;
Rp = 1;
Rs = 60;

[n, Wn] = cheb1ord(Wp, Ws, Rp, Rs);


% Design appropriate FIR filter 
Rpass  = (10^(Rp/20) - 1)/(10^(Rp/20) + 1);
Rstop = 10^(-Rs/20);



NumMin = firgr('minorder',[0 Wp Ws 1], [1 1 0 0],[Rpass,Rstop])
N = length(NumMin)-1
fvtool(NumMin)







