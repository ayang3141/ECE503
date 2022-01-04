% ECE 503 HW 2 Problem 3

x = [1 2 -1 0 -1 2];
Ck = DTFS(x); % finds the fourier coefficients

function coeff = DTFS(x)

N = length(x);
coeff = zeros(N, 1);
x_axis = zeros(N, 1);

for k = 1 : N
    x_comp = 0;
    y_comp = 0;
    
    
    for n = 1 : N
        x_comp = x_comp + x(n)*cos(2*pi*k*n/N);
        y_comp = y_comp - x(n)*sin(2*pi*k*n/N);
        
    end
    
    
    coeff(k) = x_comp/N + 1i*y_comp/N;
    x_axis(k) = k - 1;
end

figure(1);
title("Magnitude");
stem(x_axis, abs(coeff));
xlabel('n');
ylabel('mag[n]');

figure(2);
title("Phase");
stem(x_axis, angle(coeff));
xlabel('n');
ylabel('phase[n]');

end