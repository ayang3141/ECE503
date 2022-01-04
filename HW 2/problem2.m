% ECE HW 2 Problem 2

x = [3 2 1 0 1 2];
Ck = DTFS(x); % finds the fourier coefficients
isEqual = parsevals_relation(Ck, x, 10e-10);

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


function isEqual = parsevals_relation(coeff, timeValues, accuracy)
    C_sum = 0;
    time_sum = 0;
    isEqual = 1;
    for m = 1:length(coeff)
        C_sum = C_sum + abs(coeff(m)).^2;
        time_sum = time_sum + abs(timeValues(m)).^2;
    end
    C_sum
    time_sum = time_sum/length(coeff)
    
    abs(C_sum - time_sum)
    
    if(abs(C_sum - time_sum) > accuracy)
        isEqual = 0;
        disp("Power is NOT equal");
        return
    end
    disp("Power is equal");
end


