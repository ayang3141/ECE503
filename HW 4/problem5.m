% ECE 503 HW 4 Problem 5

clearvars;
close all;
clc;

A = [2 2; 2*cos((3/2)*(pi/2)) 2*cos((1/2)*(pi/2))];
b = [1; 1/2];
hCoeff = inv(A)*b;


h = zeros(1, 4);
for i = 0:1
   h(i+1) = hCoeff(i+1);
   h(4-i) = h(i+1);
end

figure(1);
stem((0:1:length(h)-1), h)
xlabel('n');
ylabel('h[n]');


