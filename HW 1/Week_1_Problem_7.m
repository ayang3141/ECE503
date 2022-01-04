clearvars;
clc;
close all;

% The transfer function G(z) = (z-1.1)/(z^2-2z+0.99);
% Check whether the given system is BIBO stable
% Check whether the given system is asymptotically or marginally stable


NUM=[0 1 -1.1];
DEN=[1 -2 0.99];

% To find zeroes and poles, find the roots

Z=roots(NUM) % zero is at 1.1
P=roots(DEN) % poles at 1.1 and 0.9;

% Although one of the poles are outside the unit circle at 1.1, it is being
% cancelled off by the zero at 1.1; Hence the sysetm is BIBO stable

% For asymptotic and marginal stability you need to find the eigen values
% of the sytem matrix Ad. (which should be at 1.1 and 0.9).

% Convert the transfer function to state space equation

[Ad, Bd, Cd, Dd]=tf2ss(NUM,DEN);

[EigenVector, EigenValue]=eig(Ad); % One of the values are greater than
% Hence the system is neither asymptotically stable nor maaaaarginally
% stable





