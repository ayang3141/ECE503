% ECE 503 TEST 2 PROBLEM 3

clearvars;
close all;
clc;


Ts = 1/12;
sNum = [1];
sDenom = [1 sqrt(2) 1];
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






