clearvars;
clc;
close all;

% Is the discrete-time system is asymptotically stable or marginally stable

%X[k+1]=AX[k]+Bu[k]  and y[k]=CX[k]+Du[k], where A=[0.9 0 2; 0 1 0; 0 0 1];
% B=[1; 0; 0]; C=[1 0 0]; D=0;

% Asymptotic or Marginal stability is associated with zero input, hence we
% need only the equation  X[k+1]=AX[k] because u[k]=0;


A=[0.9 0 2; 0 1 0; 0 0 1];
[EigenVector EigenValue]=eig(A)

% You will see that there are two eigen values at 1, however their eigen
% vectors are independent. Hence the system is marginally stable
