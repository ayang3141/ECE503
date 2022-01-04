% Adam Yang
% ECE 503 HW 3 Problem 5

% fs = 220;
f1 = 7;
f2 = 22;
N = 243;

t = 0:1:N-1;
y = sin(2*pi*f1*t) + sin(2*pi*f2*t);

result1 = radix_3_fft(y);
result2 = fft(y.');



x_axis = 0:1:N-1;
figure(1);
title("Magnitude");
stem(x_axis, abs(result1));
xlabel('n');
ylabel('mag[n]');

figure(3);
title("Phase");
stem(x_axis, angle(result1));
xlabel('n');
ylabel('phase[n]');

% Radix-3 FFT Algorithm
function result = radix_3_fft(signal)
    N = length(signal);
    
    % Initialize three separate sequences
    x1 = zeros(N/3, 1);
    x2 = zeros(N/3, 1);
    x3 = zeros(N/3, 1);
    
    % Extract three separate sequences
    for i = 0: N/3-1
        x1(i+1) = signal(3*i+1);
        x2(i+1) = signal(3*i+2);
        x3(i+1) = signal(3*i+3);
    end
    
    % Calculate three N/3 DFT's
    F1 = pf((0:1:N-1), (0:1:N/3-1), N/3)*(x1);
    F2 = pf((0:1:N-1), (0:1:N/3-1), N/3)*(x2);
    F3 = pf((0:1:N-1), (0:1:N/3-1), N/3)*(x3);
    
    % Account for the phase factors
    part1 = F1;
    part2 = pf((0:1:N-1), 1, N).* F2;
    part3 = pf(2*(0:1:N-1), 1, N).* F3;
    
    % Sum results
    result = part1+part2+part3;
             
    return

end

% phase factor matrix
function matrix = pf(n, k, N)
    matrix = exp(-1i*2*pi*(n.')*k/N);
    return
end