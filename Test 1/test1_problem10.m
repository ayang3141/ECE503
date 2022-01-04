% ECE 503 Test 1 Problem 10



N = 100;
n = 0:1:N-1;

% impulse response
h = ((0:1:N-1) + 1).^-1;
x = sinc(0.1*(0:1:N-1));

y = conv(h, x);
yout = y(1:N);

figure(1);
stem(n, yout);
xlabel('n');
ylabel('y[n]');


