% ECE 503 Test 1 Problem 6

% x[n]= (0.7)^n * u(n)
% X(z) = z/(z-0.7)
X = tf([1 0], [1 -0.7]);
N1 = 5;
N2 = 10;
N3 = 20;
N4 = 30;
N5 = 50;

% To stay on the unit circle (and thus the fourier transform): e^i*2*pi*k/N
% Sampling along the unit circle gives us the respective fourier transform
% of the signal
FT1 = zeros(1, N1);
for k = 0 : N1-1
    FT1(k+1) = evalfr(X, exp(i*2*pi*k/N1));
end

FT2 = zeros(1, N2);
for k = 0 : N2-1
    FT2(k+1) = evalfr(X, exp(i*2*pi*k/N2));
end

FT3 = zeros(1, N3);
for k = 0 : N3-1
    FT3(k+1) = evalfr(X, exp(i*2*pi*k/N3));
end

FT4 = zeros(1, N4);
for k = 0 : N4-1
    FT4(k+1) = evalfr(X, exp(i*2*pi*k/N4));
end

FT5 = zeros(1, N5);
for k = 0 : N5-1
    FT5(k+1) = evalfr(X, exp(i*2*pi*k/N5));
end


% Inverse Discrete Fourier Transform to determine time-domain signal
x1 = IDFT(FT1);
x2 = IDFT(FT2);
x3 = IDFT(FT3);
x4 = IDFT(FT4);
x5 = IDFT(FT5)


figure(1);
subplot 121;
stem((0:1:N1-1), abs(x1));
xlabel('n');
ylabel('Magnituude of x[n]');
subplot 122;
stem((0:1:N1-1), angle(x1));
xlabel('n');
ylabel('Phase of x[n]');



figure(2);
subplot 121;
stem((0:1:N2-1), abs(x2));
xlabel('n');
ylabel('Magnituude of x[n]');
subplot 122;
stem((0:1:N2-1), angle(x2));
xlabel('n');
ylabel('Phase of x[n]');



figure(3);
subplot 121;
stem((0:1:N3-1), abs(x3));
xlabel('n');
ylabel('Magnituude of x[n]');
subplot 122;
stem((0:1:N3-1), angle(x3));
xlabel('n');
ylabel('Phase of x[n]');



figure(4);
subplot 121;
stem((0:1:N4-1), abs(x4));
xlabel('n');
ylabel('Magnituude of x[n]');
subplot 122;
stem((0:1:N4-1), angle(x4));
xlabel('n');
ylabel('Phase of x[n]');



figure(5);
subplot 121;
stem((0:1:N5-1), abs(x5));
xlabel('n');
ylabel('Magnituude of x[n]');
subplot 122;
stem((0:1:N5-1), angle(x5));
xlabel('n');
ylabel('Phase of x[n]');




function result = IDFT(freq_signal)
    N = length(freq_signal);
    row = 0:1:N-1;
    column = row;
    result = inv(phase_factor(row, column, N))*(freq_signal.');
    return

end

function matrix = phase_factor(n, k, N)
    matrix = exp(-1i*2*pi*(n.')*k/N);
    return
end