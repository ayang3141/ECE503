clearvars;
clc;
close all;

% Find the zero input respose of the system defined by
% G(z)=(z-0.1)/(z^2+0.6z+0.9). Given y[-1]=0.1 and y[-2]=0.2;



% See Example 2 Lecture 3 for the difference equation

% y[n]=0.6y[n-1]-0.9y[n-2]+u[n-1]-0.1u[n-2]. Set all u=0 for zero input

% you cannot define negative or zero array in MATLAB, hence you need to
% shift the array in time n=m-3;;

% y[m=1]=0.2 and y[m=2]=0.1;


N=100;
y=zeros(N,1);
n=zeros(N,1);
y(1)=0.2;
y(2)=0.1;


for m=3:N
    y(m)=0.6*y(m-1)-0.9*y(m-2);
        n(m)=m-3;
end


stem(n,y);
xlabel('n');
ylabel('y[n]');


        

