% ECE 503 Test 1 Problem 2

x = exp(0.3*(0:1:9));
x_axis = 0:1:9;
result = DFT(x);

figure(1);
subplot 121;
title("Magnitude");
stem(x_axis, abs(result));
xlabel('n');
ylabel('mag[n]');
subplot 122;
title("Phase");
stem(x_axis, angle(result));
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