% ECE 503 Test 1 Problem 1

% Define the two input aperiodic input signals
syms x
y = piecewise(-0.005 <= x < 0, exp(1000*x), 0 <= x <= 0.005, exp(-1000*x));
f1 = 5000;
f2 = 1000;
t1 = -0.005:1/f1:0.005;
t2 = -0.005:1/f2:0.005;

% Signal 1
x1 = double(subs(y, x, t1));
% Signal 2
x2 = double(subs(y, x, t2));

x1_axis = 0:1:length(x1)-1;
x2_axis = 0:1:length(x2)-1;

result1 = DFT(x1);
result2 = DFT(x2);

figure(1);
subplot 121;
title("Magnitude");
stem(x1_axis, abs(result1));
xlabel('n');
ylabel('mag[n]');
subplot 122;
title("Phase");
stem(x1_axis, angle(result1));
xlabel('n');
ylabel('phase[n]');


figure(2);
subplot 121;
title("Magnitude");
stem(x2_axis, abs(result2));
xlabel('n');
ylabel('mag[n]');
subplot 122;
title("Phase");
stem(x2_axis, angle(result2));
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