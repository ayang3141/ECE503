clearvars;
clc;
close all;

% The transfer function of a system is G(z) = (z-0.5)/(z^2+0.5z+0.06). Find
% the response of the system when the input x[n]=(1/3)^n +(1/2)^(n-1)

% Define discrete transfer function first

NUM=[0 1 -0.5]; %these are the coefficients of the numerator. The order should be same as the order of the denominator
DEN=[1 0.5 0.06];

G=tf(NUM,DEN,-1); % transfer function is defined, and make sure to include -1 for DT systems. 
%Type G in command window to see the structure of transfer function


n=[0:1:50];  % n can be of any length

x=(1/3).^n+(1/2).^(n-1); % define the input in time domain

% Find the impulse response of the system

h=impulse(G,length(n));

y=conv(h,x);  % use conv to find the output
yout=y(1:length(n));

stem(yout);






