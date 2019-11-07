clear
close all
load parameter

x0 = 2;
x1 = 3;
x2 = 4;
x3 = 5;
S = 100;
r = 1;
h = S / (x1 / 2 + x2 + x3 / 2);

tset = (0: 0.001: 40)';
N = length(tset);
wset = zeros(1, N);


figure;
plot(tset, onewavevector(x0, x1, x2, x3, h, r, tset, 2));
xlabel('t (s)');
ylabel('p (kW)');