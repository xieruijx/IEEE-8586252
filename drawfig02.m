clear
close all
load parameter

ntimes = zeros(n, 1);
[z, v, zy, pg, p] = PSOinit();
[z, fv] = PSOiter(z, v, zy, pg, p, wmin, [0;600], [40;40], ntimes, Ms);
save('prez','z');

T = 600;

t = (0:0.001:(2 * T))';
tnum = length(t);
[x0, x1, x2, x3, xnum] = getx(z);
y = x1 + x2 + x3;
h = S ./ (x1 / 2 + x2 + x3 / 2);

figure;
plot(t, wavesum(x0, x1, x2, x3, h, r, t, xnum, tnum, Nmax), 'b', [0;1200], [40;40], 'r' );
axis([0, 2 * T, 0, 1.2 * max(ub)]);
legend('1', '2');
xlabel('t (s)');
ylabel('p (kW)');
