% ECE 503 Test 1 Problem 4


x = [0.5 0.5 0.5 0.5 0 0 0 0];
n = 0:1:length(x)-1;
result = radix_2_fft(x);


figure(1);
subplot 121;
stem(n,abs(result));
xlabel('n');
ylabel('Magnitude');
subplot 122;
stem(n,angle(result));
xlabel('n');
ylabel('Phase');




% Radix-2 FFT Algorithm
function result = radix_2_fft(signal)
    N = length(signal);
    
    % Initialize two separate sequences
    x1 = zeros(N/2, 1);
    x2 = zeros(N/2, 1);
    
    % Extract two separate sequences
    for i = 0: N/2-1
        x1(i+1) = signal(2*i+1);
        x2(i+1) = signal(2*i+2);
    end
    
    % Calculate two N/2 DFT's
    F1 = pf((0:1:N-1), (0:1:N/2-1), N/2)*(x1);
    F2 = pf((0:1:N-1), (0:1:N/2-1), N/2)*(x2);
    
    % Account for the phase factors
    part1 = F1;
    part2 = pf((0:1:N-1), 1, N).* F2;
    
    % Sum results
    result = part1+part2;
             
    return

end

% phase factor matrix
function matrix = pf(n, k, N)
    matrix = exp(-1i*2*pi*(n.')*k/N);
    return
end

















