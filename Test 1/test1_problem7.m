% ECE 503 Test 1 Problem 7

% Transfer function is determined to be
% Y(z)/X(z) = [6 27 12]/[6 -5 1 0]

G = tf([6 27 12], [6 -5 1 0]);

N = 100;
% Fourier transform can be obtained by evaluating the z-transform along the
% unit circle

FT = zeros(1, N);
for k = 0 : N-1
    FT(k+1) = evalfr(G, exp(i*2*pi*k/N));
end

figure(1);
subplot 121;
stem((0:1:N-1), abs(FT));
xlabel('n');
ylabel('Magnituude');
subplot 122;
stem((0:1:N-1), angle(FT));
xlabel('n');
ylabel('Phase');




