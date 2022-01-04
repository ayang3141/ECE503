% Adam Yang
% ECE 503 HW 1


clearvars;
clc;
close all;

%% Question 1

N = 100;
% Check for linearity

% input u1[n] = 1
y1 = zeros(N, 1);
n = zeros(N, 1);
u1 = ones(N, 1);
y1(1) = 1;
y1(2) = 1;
y1(3) = 0.7;

% response of system from input u1[n]=1
for m = 4:N
    y1(m) = -1*y1(m-3) - 0.3*y1(m-2)*y1(m-1) + u1(m);
    n(m) = m-4;
end

figure(1);
stem(n,y1);
xlabel('n');
ylabel('y[n]');


% input u2[n] = 3
y2 = zeros(N, 1);
u2 = 3*ones(N, 1);
y2(1) = 3;
y2(2) = 3;
y2(3) = 0.3;

% response of system from input u2[n]=3
for m = 4:N
    y2(m) = -1*y2(m-3) - 0.3*y2(m-2)*y2(m-1) + u2(m);
end

figure(2);
stem(n,y2);
xlabel('n');
ylabel('y[n]');


% input u1[n] + u2[n] = 1 + 3 = 4
y3 = zeros(N, 1);
u3 = 4*ones(N, 1);
y3(1) = 4;
y3(2) = 4;
y3(3) = -0.8;

% response of system from input u2[n]=3
for m = 4:N
    y3(m) = -1*y3(m-3) - 0.3*y3(m-2)*y3(m-1) + u3(m);
end

figure(3);
stem(n,y3);
xlabel('n');
ylabel('y[n]');

sum = y1 + y2
diff = y3 - sum


essentiallyEqual(diff, 10e-12);




function isEqual = essentiallyEqual(a, accuracy)

    for m=1:length(a)
        if abs(a(m)) > accuracy
            isEqual = 0;
            disp("The system is NOT LINEAR");
            return
        end
    end
    isEqual = 1;
    disp("The system is LINEAR");
end





%% Question 2

% G(z) = z^2/(z^2 - 1.5z + 0.5)
num = [1 0 0];
denom = [1 -1.5 0.5];
dtf = tf(num, denom, -1);
% recall that this is the transfer fucntion, i.e. the zero-state impulse response 
% y[n] - 1.5y[n-1] + 0.5y[n-2] = u[n]


N = 100;
y = zeros(N,1);
n = zeros(N,1);
y(1) = 0.2;
y(2) = 0.2;


for m=3:N
    y(m) = 1.5*y(m-1) - 0.5*y(m-2);
        n(m) = m-3;
end


stem(n,y);
xlabel('n');
ylabel('y[n]');

%% Question 3

% y[n] - 3y[n-1] - 4y[n-2] = x[n] + 2x[n-1]

N = 100;
x = ones(N,1);
y = zeros(N,1);
n = zeros(N,1);
y(1) = 0;
y(2) = 0;
% x(1) = 0;
% x(2) = 0;


for m=3:N
    y(m) = 3*y(m-1) + 4*y(m-2) + x(m) + 2*x(m-1);
    n(m) = m-3;
end

stem(n,y);
xlabel('n');
ylabel('y[n]');


%% Question 4

% G(z) = (3 - 4z^-1)/(1 - 3.5z^-1 + 1.5z^-2)
% check whether the system is (a) causal (b) BIBO stable and (c) asymptotic or marginal stable

% a)
% y(n) - 3.5*y(n-1) + 1.5*y(n-2) = 3*x(n) - 4*x(n-1)
% as a result, the system is indeed causal

% b)
num = [3 4 0];
denom = [1 -3.5 1.5];

G = tf(num, denom, -1);
systemPoles = pole(G)
systemZeros = zero(G)

% there exists a system pole outside the unit circle, so the system is not
% BIBO


% c)
[A, B, C, D] = tf2ss(num, denom);

[EVector, EValue] = eig(A)

% since the system is unstable, the system is neither asymptotically stable
% or marginally stable





%% Question 5

% Using convolution compute the zero state response given the impulse
% response as h[n] = (1/3)^n * u[n] and the input 
% x[n] = (1/2)^n * cos(n*pi/3) * u[n] where u[n] is the unit step function


n = 0:1:100;
u = ones(1, length(n));

h = ((1/3).^n).*u % impulse response (i.e. transfer function with zero state)

x = ((1/2).^n).*(cos(n*pi/3)).*u; % input 


y = conv(h,x);
yout = y(1:length(n));

stem(yout);











