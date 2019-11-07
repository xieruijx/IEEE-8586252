clear
close all
setting
load parameter

xub = [0;T];
ub = [4000;4000];
save parameter

ntimes = zeros(n, 1);
% [z, v, zy, pg, p] = PSOinit();
% [z, fv] = PSOiter(z, v, zy, pg, p, wmin, [0;T], [4000;4000]/2, ntimes, Ms);
% save('prez','z');
load result1
objective(z, ntimes)

t1 = (0:0.001:T)';
% t2 = (T:0.001:2 * T)';
tnum = length(t1);
[x0, x1, x2, x3, xnum] = getx(z);
y = x1 + x2 + x3;
h = S ./ (x1 / 2 + x2 + x3 / 2);

figure;
plot([0;2 * T], [4000;4000], 'k--', t1, wavesum(x0, x1, x2, x3, h, r, t1, xnum, tnum, Nmax), 'k-', t1, wavesum(x0(1), x1(1), x2(1), x3(1), h(1), r(1), t1, 1, tnum, Nmax(1)), 'k-.', t1, wavesum(x0(1), x1(2), x2(2), x3(2), h(2), r(2), t1, 1, tnum, Nmax(2)), 'k:');
% hold on
% plot([T, T], [0, 5000], 'k', 'linewidth', 3);
% hold on
% plot(t2, wavesum(x0, x1, x2, x3, h, r, t2, xnum, tnum, Nmax), 'k-', t2, wavesum(x0(1), x1(1), x2(1), x3(1), h(1), r(1), t2, 1, tnum, Nmax(1)), 'k-.', t2, wavesum(x0(1), x1(2), x2(2), x3(2), h(2), r(2), t2, 1, tnum, Nmax(2)), 'k:');
axis([0, T, 0, 1.5 * max(ub)]);
legend('P_A', 'P_S(t)', 'P_1(t)', 'P_2(t)');
xlabel('Time (s)');
ylabel('Power (kW)');

floor((T - x0)./(y + r))

clear
setting