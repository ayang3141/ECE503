% ECE 503 Test 1 Problem 5

% y[n] = -0.2*y[n-2] - 0.6*n^2*y[n-1] + x[n]
% y[-1] = 0.1
% y[-2] = 0.5

N = 20;
y = zeros(N, 1);
n = 0:1:N-1;

y(1) = 0.5;
y(2) = 0.1;

x = (0.5).^(0:1:N-1);

for i = 3 : N
    y(i) = -0.2*y(i-2) - 0.6*((i-1).^2)*y(i-1) + 0.2*x(i);
end

figure(1);
stem(n,y);
xlabel('n');
ylabel('y[n]');
