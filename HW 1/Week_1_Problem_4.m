clearvars;
clc;
close all;

% The transfer function G(z) = (z-1)/(z^2+0.5z+0.06). Find the unit impulse
% and unit step function


% Define discrete transfer function first

NUM=[0 1 -1]; %these are the coefficients of the numerator. The order should be same as the order of the denominator
DEN=[1 0.5 0.06];

SYS=tf(NUM,DEN,-1); % transfer function is defined, and make sure to include -1 for DT systems. 
%Type SYS in command window to see the structure of transfer function



yI=impulse(SYS);
yu=step(SYS);

figure(1)
stem(yI)
title('Impulse Response');

figure(2)
stem(yu);

title('Step Response');



