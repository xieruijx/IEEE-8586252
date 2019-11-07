clear
close all
setting
load parameter

xub = [0;T];
ub = [4000;4000];
Nmax(1) = 6;
Nmin(2) = 10;
save parameter



ntimes = zeros(n, 1);
[z, v, zy, pg, p] = PSOinit();
[x0, x1, x2, x3] = getx(pg');
y = x1 + x2 + x3;
floor((T - x0)./(y + r))
[z, fv] = PSOiter(z, v, zy, pg, p, wmin, [0;T], [4000;4000], ntimes, Ms);
save('prez','z');
objective(z, ntimes)

t = (0:0.001:T)';
tnum = length(t);
[x0, x1, x2, x3, xnum] = getx(z);
y = x1 + x2 + x3;
h = S ./ (x1 / 2 + x2 + x3 / 2);

figure;
% plot([0;T], [4000;4000], 'k', t, wavesum(x0, x1, x2, x3, h, r, t, xnum, tnum, Nmax), 'b', t, wavesum(x0(1), x1(1), x2(1), x3(1), h(1), r(1), t, 1, tnum, Nmax(1)), 'g', t, wavesum(x0(1), x1(2), x2(2), x3(2), h(2), r(2), t, 1, tnum, Nmax(2)), 'r');
plot([0;T], [4000;4000], 'k', t, wavesum(x0, x1, x2, x3, h, r, t, xnum, tnum, Nmax), 'b', t, onewavevector(x0(1), x1(1), x2(1), x3(1), h(1), r(1), t, Nmax(1)), 'g', t, onewavevector(x0(2), x1(2), x2(2), x3(2), h(2), r(2), t, Nmax(2)), 'r');
axis([0, T, 0, 1.2 * max(ub)]);
legend('P_A', 'P_S(t)', 'P_1(t)', 'P_2(t)');
xlabel('Time (s)');
ylabel('Power (kW)');

floor((T - x0)./(y + r))

clear
load parameter
xub = [0;10;20;30;100;110;120;130;200;210;220;230;300];
ub = [40;30;30;40;40;30;30;40;40;30;30;40;40]*100;
Nmax(1) = 1000;
Nmin(2) = 0;
save parameter