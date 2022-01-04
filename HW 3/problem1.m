% Adam Yang
% ECE 503 HW 3 Problem 1


x1 = [3, 2, 1, 0, 1, 2, 0, 0, 0, 0];
x2 = [1, 1, 1, 1, 1, 1, 0, 0, 0, 0];


result1 = DFT(x1)
result1_fft = fft(x1.')

result2 = DFT(x2)
result2_fft = fft(x2.')


x_axis = 0:1:9;

% Problem 4.4
figure(1);
title("Magnitude");
stem(x_axis, abs(result1));
xlabel('n');
ylabel('mag[n]');

figure(2);
title("Phase");
stem(x_axis, angle(result1));
xlabel('n');
ylabel('phase[n]');

figure(3);
title("Magnitude");
stem(x_axis, abs(result1_fft));
xlabel('n');
ylabel('mag[n]');

figure(4);
title("Phase");
stem(x_axis, angle(result1_fft));
xlabel('n');
ylabel('phase[n]');

% Problem 4.9a
figure(5);
title("Magnitude");
stem(x_axis, abs(result2));
xlabel('n');
ylabel('mag[n]');

figure(6);
title("Phase");
stem(x_axis, angle(result2));
xlabel('n');
ylabel('phase[n]');

figure(7);
title("Magnitude");
stem(x_axis, abs(result2_fft));
xlabel('n');
ylabel('mag[n]');

figure(8);
title("Phase");
stem(x_axis, angle(result2_fft));
xlabel('n');
ylabel('phase[n]');

function result = DFT(signal)
    N = length(signal);
    row = 0:1:N-1;
    column = row;
    result = phase_factor(row, column, N)*(signal.');
    return

end

function matrix = phase_factor(n, k, N)
    matrix = exp(-1i*2*pi*(n.')*k/N);
    return
end