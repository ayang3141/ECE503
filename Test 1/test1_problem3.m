% ECE 503 Test 1 Problem 3

% System difference equation
% y[n] = p*y[n-1](1 - y[n-1])

N = 50;
y1 = zeros(1, N);
y2 = zeros(1, N);
y3 = zeros(1, N);
y4 = zeros(1, N);
n = 0:1:N-1;

p = [2.5 3.2 3.5 4];
y1(1) = 0.02;
y2(1) = 0.02;
y3(1) = 0.02;
y4(1) = 0.02;

for i = 2 : N
    y1(i) = p(1)*y1(i-1)*(1 - y1(i-1));
    y2(i) = p(2)*y2(i-1)*(1 - y2(i-1));
    y3(i) = p(3)*y3(i-1)*(1 - y3(i-1));
    y4(i) = p(4)*y4(i-1)*(1 - y4(i-1));
end

FT1 = DFT(y1);
FT2 = DFT(y2);
FT3 = DFT(y3);
FT4 = DFT(y4);


figure(1);
subplot 121;
stem(n,abs(FT1));
xlabel('n');
ylabel('magnitude with p = 2.5');
subplot 122;
stem(n,angle(FT1));
xlabel('n');
ylabel('phase with p = 2.5');

figure(2);
stem(n,y1);
xlabel('n');
ylabel('y[n] with p = 2.5');



figure(3);
subplot 121;
stem(n,abs(FT2));
xlabel('n');
ylabel('magnitude with p = 3.2');
subplot 122;
stem(n,angle(FT2));
xlabel('n');
ylabel('phase with p = 3.2');

figure(4);
stem(n,y2);
xlabel('n');
ylabel('y[n] with p = 3.2');



figure(5);
subplot 121;
stem(n,abs(FT3));
xlabel('n');
ylabel('magnitude with p = 3.5');
subplot 122;
stem(n,angle(FT3));
xlabel('n');
ylabel('phase with p = 3.5');

figure(6);
stem(n,y3);
xlabel('n');
ylabel('y[n] with p = 3.5');




figure(7);
subplot 121;
stem(n,abs(FT4));
xlabel('n');
ylabel('magnitude with p = 4');
subplot 122;
stem(n,angle(FT4));
xlabel('n');
ylabel('phase with p = 4');

figure(8);
stem(n,y4);
xlabel('n');
ylabel('y[n] with p = 4');



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
