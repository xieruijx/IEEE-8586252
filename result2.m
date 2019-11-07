clear
close all
setting
load parameter

ntimes = zeros(n, 1);
[z, v, zy, pg, p] = PSOinit();
[z, fv] = PSOiter(z, v, zy, pg, p, wmin, xub, ub, ntimes, Ms);
save('prez','z');

t = (0:0.001:T)';
tnum = length(t);
[x0, x1, x2, x3, xnum] = getx(z);
y = x1 + x2 + x3;
h = S ./ (x1 / 2 + x2 + x3 / 2);

figure;
plot(xub, ub, 'k', t, wavesum(x0, x1, x2, x3, h, r, t, xnum, tnum, Nmax), 'b');
axis([0, T, 0, 1.2 * max(ub)]);
legend('P_A(t)', 'P_S(t)');
xlabel('Time (s)');
ylabel('Power (kW)');

objective(z, ntimes)