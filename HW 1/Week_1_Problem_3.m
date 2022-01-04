clearvars;
clc;
close all;

% Learn z transform and inverse z transform

% Find the z transform of 0.1^n;

syms n

F=ztrans(0.1^n)  % calculates the z transform

f=iztrans(F) % calculates the inverse z transform


% Now learn findiing laplace transform and inverse laplace transform in
% MATLAB for a continous time function
