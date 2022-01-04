

% Adam Yang
% ECE 503 HW 1 Problem 5


clearvars;
clc;
close all;


% Using convolution compute the zero state response given the impulse
% response as h[n] = (1/3)^n * u[n] and the input 
% x[n] = (1/2)^n * cos(n*pi/3) * u[n] where u[n] is the unit step function


n = 0:1:50;
u = ones(1, length(n));

h = ((1/3).^n).*u; % impulse response (i.e. transfer function with zero state)

x = ((1/2).^n).*(cos(n*pi/3)).*u; % input 


y = conv(h,x);
yout = y(1:length(n));

figure(1);
stem(yout);
xlabel('n');
ylabel('y[n]');