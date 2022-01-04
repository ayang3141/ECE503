% Adam Yang
% ECE 503 HW 3 Problem 4

% G(z) = 1/(1 - 0.4z^-1 - 0.05z^-2)
% x(n) = -(0.2)^n + 0.5(0.3)^n
% y(-1) = 0.1 and y(-2) = 0.2



systemNum = [1 0 0];
systemDenom = [1 -0.4 -0.05];

initialCond = [0.1, 0.2];

N = 50;
x = zeros(N, 1);
for i = 1 : N
    x(i) = -1*(0.2)^(i-1) + 0.5*(0.3)^(i-1);
end

figure(1);
stem(x);

xic = filtic(systemNum, systemDenom, initialCond);

y = filter(systemNum, systemDenom, x, xic);


figure(3);
stem(y);


