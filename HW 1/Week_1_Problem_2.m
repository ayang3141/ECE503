clearvars;
clc;
close all;

% The impulse response of a system h[n]=(0.5)^n. Find the unit step
% response

n=0:1:50;  % n should theretically go up to infinity

h=(0.5).^n

u=ones(1,length(n)) % here also n should go up to infinity

% MATLAB will pad with zeros for any values beyond n=21, and it will give
% wrong values and should be removed.

y=conv(h,u) % here you cannot take the entire value of y as n has only 21 values

yout=y(1:length(n))

stem(yout);

% try changing different n values