% Adam Yang
% ECE 503 HW 1 Problem 1


clearvars;
clc;
close all;


N = 100;
% Check for linearity

% input u1[n] = 1
y1 = zeros(N, 1);
n = zeros(N, 1);
u1 = ones(N, 1);
y1(1) = 1;
y1(2) = 1;
y1(3) = 0.7;

% response of system from input u1[n]=1
for m = 4:N
    y1(m) = -1*y1(m-3) - 0.3*y1(m-2)*y1(m-1) + u1(m);
    n(m) = m-4;
end

figure(1);
stem(n,y1);
xlabel('n');
ylabel('y[n]');


% input u2[n] = 3
y2 = zeros(N, 1);
u2 = 3*ones(N, 1);
y2(1) = 3;
y2(2) = 3;
y2(3) = 0.3;

% response of system from input u2[n]=3
for m = 4:N
    y2(m) = -1*y2(m-3) - 0.3*y2(m-2)*y2(m-1) + u2(m);
end

figure(2);
stem(n,y2);
xlabel('n');
ylabel('y[n]');


% input u1[n] + u2[n] = 1 + 3 = 4
y3 = zeros(N, 1);
u3 = 4*ones(N, 1);
y3(1) = 4;
y3(2) = 4;
y3(3) = -0.8;

% response of system from input u2[n]=3
for m = 4:N
    y3(m) = -1*y3(m-3) - 0.3*y3(m-2)*y3(m-1) + u3(m);
end

figure(3);
stem(n,y3);
xlabel('n');
ylabel('y[n]');

sum = y1 + y2
diff = y3 - sum


essentiallyEqual(diff, 10e-12);



% round-off error exists, so this function accountsw for potential errors
% from calculations
function isEqual = essentiallyEqual(a, accuracy)
    isEqual = 1;
    for m=1:length(a)
        if abs(a(m)) > accuracy
            isEqual = 0;
            disp("The system is NOT LINEAR");
            return
        end
    end
    disp("The system is LINEAR");
end
