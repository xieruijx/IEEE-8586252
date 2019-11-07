clear
close all
load parameter

ntimes = zeros(n, 1);
[z, v, zy, pg, p] = PSOinit();
[z, fv] = PSOiter(z, v, zy, pg, p, wmin, [0;600], [40;40], ntimes, Ms);
save('prez','z');

t = (0:0.001:T)';
tnum = length(t);
[x0, x1, x2, x3, xnum] = getx(z);
y = x1 + x2 + x3;
h = S ./ (x1 / 2 + x2 + x3 / 2);

figure;
plot([0;600], [40;40], 'r', t, wavesum(x0, x1, x2, x3, h, r, t, xnum, tnum, Nmax), 'b', t, wavesum(x0(1), x1(1), x2(1), x3(1), h(1), r(1), t, 1, tnum, Nmax(1)), 'g');
axis([0, T, 0, 1.2 * max(ub)]);
legend('1', '2', '3');
xlabel('t (s)');
ylabel('p (kW)');
