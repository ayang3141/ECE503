% ECE 503 Test 1 Problem 8


% G(z) = (3z^2 - 2z + 5)/(z^3 + 4z^2 + 2.5z + 3)

% y(n) + 4*y(n-1) + 2.5*y(n-2) + 3*y(n-3) = 3*x(n-1) - 2*x(n-2) + 5*x(n-3)

N = 50;
y = zeros(N, 1);
n = 0:1:N-1;

x = zeros(N, 1);

y(1) = 0.5;
y(2) = 1;
y(3) = 0.1;

for i = 4 : N
    y(i) = -4*y(i-1) - 2.5*y(i-2) - 3*y(i-3) + 3*x(i-1) - 2*x(i-2) + 5*x(i-3);
end

figure(1);
stem(n,y);
xlabel('n');
ylabel('y[n]');
