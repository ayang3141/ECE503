% ECE 503 HW 2
%% Problem 2

x = [3 2 1 0 1 2]
N = length(x);
mag = zeros(N, 1);
phase = zeros(N, 1);
x_axis = zeros(N, 1);

for k = 1 : N
    x_comp = 0;
    y_comp = 0;
    
    
    for n = 1 : N
        x_comp = x_comp + x(n)*cos(2*pi*k*n/N);
        y_comp = y_comp - x(n)*sin(2*pi*k*n/N);
        
    end
    
    
    mag(k) = abs(x_comp/N + 1i*y_comp/N);
    phase(k) = angle(x_comp/N + 1i*y_comp/N);
    x_axis(k) = k - 1;
end


figure(1);
title("Magnitude");
stem(x_axis, mag);
xlabel('n');
ylabel('mag[n]');

figure(2);
title("Phase");
stem(x_axis, phase);
xlabel('n');
ylabel('phase[n]');


%% Problem 3

x = [1 2 -1 0 -1 2];
N = length(x);
mag = zeros(N, 1);
phase = zeros(N, 1);
x_axis = zeros(N, 1);

for k = 1 : N
    x_comp = 0;
    y_comp = 0;
    
    
    for n = 1 : N
        x_comp = x_comp + x(n)*cos(2*pi*k*n/N);
        y_comp = y_comp - x(n)*sin(2*pi*k*n/N);
        
    end
    
    
    mag(k) = abs(x_comp/N + 1i*y_comp/N);
    phase(k) = angle(x_comp/N + 1i*y_comp/N);
    x_axis(k) = k - 1;
end


figure(1);
title("Magnitude");
stem(x_axis, mag);
xlabel('n');
ylabel('mag[n]');

figure(2);
title("Phase");
stem(x_axis, phase);
xlabel('n');
ylabel('phase[n]');



%% Problem 4


N = 8;
length = 50;
mag = zeros(length, 1);
phase = zeros(length, 1);
x_axis = zeros(length, 1);
syms x
y = piecewise(0 <= x <= 6, sin(x*pi/3), x == 7, 0);


for n = 1 : length
    x_comp = 0;
    y_comp = 0;
    
    for k = 0 : N-1
        x_comp = x_comp + subs(y, k)*cos(2*pi*k*n/8);
        y_comp = y_comp + subs(y, k)*sin(2*pi*k*n/8);
    end
    mag(n) = abs(x_comp + 1i*y_comp);
    phase(n) = angle(x_comp + 1i*y_comp);
    x_axis(n) = n - 1;
end

figure(1);
title("Magnitude");
stem(x_axis, mag);
xlabel('n');
ylabel('mag[n]');

figure(2);
title("Phase");
stem(x_axis, phase);
xlabel('n');
ylabel('phase[n]');

%% Problem 5




