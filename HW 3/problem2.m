% Adam Yang
% ECE 503 HW 3 Problem 2

% Initialize the test DFT signals
k1 = 0:1:4;
X1 = exp(1i*2*pi*k1/length(k1));

k2 = 0:1:7;
X2 = exp(1i*(2*pi*k2 + pi)/length(k2));


result1 = IDFT(X1, length(X1))
result1_fft = ifft(X1.')

result2 = IDFT(X2, length(X2))
result2_fft = ifft(X2.')







function result = IDFT(freq_signal, N)
    row = 0:1:N-1;
    column = row;
    result = inv(phase_factor(row, column, N))*(freq_signal.');
    return

end

function matrix = phase_factor(n, k, N)
    matrix = exp(-1i*2*pi*(n.')*k/N);
    return
end