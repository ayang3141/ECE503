
% Adam Yang
% ECE 503 HW 1 Problem 3


clearvars;
clc;
close all;


% y[n] - 3y[n-1] - 4y[n-2] = x[n] + 2x[n-1]

N = 50;
x = ones(N,1);
y = zeros(N,1);
n = zeros(N,1);

% Initial conditions are all zero
y(1) = 0;
y(2) = 0;
% Initial inputs
x(1) = 0;
x(2) = 1;


for m=3:N
    y(m) = 3*y(m-1) + 4*y(m-2) + x(m) + 2*x(m-1);
    n(m) = m-3;
end

y
stem(n,y);
xlabel('n');
ylabel('y[n]');