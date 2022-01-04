

% Adam Yang
% ECE 503 HW 1 Problem 4


clearvars;
clc;
close all;




% G(z) = (3 - 4z^-1)/(1 - 3.5z^-1 + 1.5z^-2)
% check whether the system is (a) causal (b) BIBO stable and (c) asymptotic or marginal stable

% a)
% y(n) - 3.5*y(n-1) + 1.5*y(n-2) = 3*x(n) - 4*x(n-1)
% as a result, the system is indeed causal

% b)
num = [3 -4 0];
denom = [1 -3.5 1.5];

G = tf(num, denom, -1)
systemPoles = pole(G)
systemZeros = zero(G)

% there exists a system pole outside the unit circle, so the system is not
% BIBO


% c)
[A, B, C, D] = tf2ss(num, denom);

[EVector, EValue] = eig(A)

% since the system is unstable, the system is neither asymptotically stable
% or marginally stable
