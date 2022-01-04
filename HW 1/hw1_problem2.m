
% Adam Yang
% ECE 503 HW 1 Problem 2


clearvars;
clc;
close all;


N = 100;
y = zeros(N,1);
n = zeros(N,1);
% All initial conditions are 0.2
y(1) = 0.2;
y(2) = 0.2;

%input is all zero

for m=3:N
    y(m) = 1.5*y(m-1) - 0.5*y(m-2);
        n(m) = m-3;
end


stem(n,y);
xlabel('n');
ylabel('y[n]');