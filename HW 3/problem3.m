% Adam Yang
% ECE 503 HW 3 Problem 3



systemNum = [0.1 0.2];
systemDenom = [1 0.2 0.6 0.8];
systemTF = tf(systemNum, systemDenom);

% if the signal is x[n] = sin[0.1n], then the steady state output is 
% y[n] = A|G(w0)|sin(w0n + <G(w0))

freqZero = 0.1;
freqResp = evalfr(systemTF, freqZero)
mag = abs(freqResp)
phase = angle(freqResp)

N = 100;
y = zeros(N, 1);
x = zeros(N, 1);
x_axis = zeros(N, 1);

for i = 1 : N
    y(i) = mag*sin(freqZero*(i-1) + phase);
    x(i) = sin(freqZero*(i-1));
    x_axis(i) = i-1;
end


figure(1);
title("Input");
stem(x_axis, x);
xlabel('n');
ylabel('x[n]');

figure(3);
title("Steady-State Response");
stem(x_axis, y);
xlabel('n');
ylabel('y[n]');


