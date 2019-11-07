clear
close all
setting
load parameter

Nmax(1) = 10;
Nmin(2) = 10;
save parameter



ntimes = zeros(n, 1);
[z, v, zy, pg, p] = PSOinit();


testlim(pg', S, im, imm, T, Nmin, wmin, r)

[x0, x1, x2, x3] = getx(pg');
y = x1 + x2 + x3;
floor((T - x0)./(y + r))
[z, fv] = PSOiter(z, v, zy, pg, p, wmin, xub, ub, ntimes, Ms);
save('prez','z');
xobjective(z, ntimes)

t = (0:0.001:T)';
tnum = length(t);
[x0, x1, x2, x3, xnum] = getx(z);
y = x1 + x2 + x3;
h = S ./ (x1 / 2 + x2 + x3 / 2);

nmax = min(floor((T - x0)./(y + r)), Nmax);

figure;
plot(xub, ub, 'k', t, wavesum(x0, x1, x2, x3, h, r, t, xnum, tnum, nmax), 'b', t, onewavevector(x0(1), x1(1), x2(1), x3(1), h(1), r(1), t, nmax(1)), 'g', t, onewavevector(x0(2), x1(2), x2(2), x3(2), h(2), r(2), t, nmax(2)), 'r');
axis([0, T, 0, 1.2 * max(ub)]);
legend('P_A(t)', 'P_S(t)', 'P_1(t)', 'P_2(t)');
xlabel('Time (s)');
ylabel('Power (kW)');

floor((T - x0)./(y + r))

clear
load parameter

Nmax(1) = 1000;
Nmin(2) = 0;
save parameter