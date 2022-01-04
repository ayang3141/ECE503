% ECE 503 Test 1 Problem 9



N = 150;
y = zeros(N, 1);
n = 0:1:N-1;

for i = 1 : N
    y(i) = (i-1)*(0.9).^(i-1)
end

figure(1);
stem(n,y);
xlabel('n');
ylabel('y[n]');

% The system is BIBO because the graph of the impulse response shows that
% the impulse response of the system is absolutely integrable.