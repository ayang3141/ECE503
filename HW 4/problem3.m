% ECE 503 HW 4 Problem 3

clearvars;
close all;
clc;


Ts = 0.1;
sNum = [1 0.1];
sDenom = [1 0.2 9.01];
zeros = roots(sNum);
poles = roots(sDenom);

zNum = [1];
for i = 1:length(zeros)
    zZero = exp(zeros(i)*Ts);
    zNum = conv(zNum, [1 -1*zZero]);
end

zDenom = [1];
for i = 1:length(poles)
    zPoles = exp(poles(i)*Ts);
    zDenom = conv(zDenom, [1 -1*zPoles]);
end


H = tf(zNum, zDenom)