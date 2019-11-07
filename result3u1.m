clear
close all
load parameter

Nmax(1) = 10;
Nmin(2) = 10;
save parameter



ntimes = zeros(n, 1);
% [z, v, zy, pg, p] = PSOinit();
load result1
pg = z';
z0 = analytical();
[~, x10, x20, x30] = getx(z0);
h0 = S ./ (x10 / 2 + x20 + x30 / 2);
z = zeros(N, 4 * n);
z(:, 1: n) = ones(N, 1) * wmin' + ones(N, 1) * r' .* rand(N, n);
z(:, (n + 1): (2 * n)) = ones(N, 1) * (h0 ./ im)' + rr * rand(N, n);
z(:, (3 * n + 1): (4 * n)) = ones(N, 1) * (h0 ./ imm)' + rr * rand(N, n);
z(:, (2 * n + 1): (3 * n)) = (ones(N, 1) * S' / max(ub)) + (ones(N, 1) * x20' - ones(N, 1) * S' / max(ub)) .* rand(N, n) + rr * rand(N, n);
v = rand(N, 4 * n);
p = zeros(N, 1);
zy = z;
pz = testlim(z', S, im, imm, T, Nmin, wmin, r);
if ~all(pz == 0)
    m = ones(N, 1);
    for i = 1: N
        if pz(i)
            m(i) = wavemax(z(i, :)', S, r, T, xub, ub, Nmax);
        end
    end
    oo = ofun(z', ntimes);
    fz = (oo < p) & (m <= 0) & pz;
    if ~all(fz == 0)
        p(fz) = oo(fz);
        zy(fz, :) = z(fz, :);
        [minp, minindex] = min(p);
        if minp < 0
            pg = z(minindex, :);
        end
    end
end

testlim(pg', S, im, imm, T, Nmin, wmin, r)

[x0, x1, x2, x3] = getx(pg');
y = x1 + x2 + x3;
floor((T - x0)./(y + r))
[z, fv] = PSOiter(z, v, zy, pg, p, wmin, xub, ub, ntimes, Ms);
save('prez','z');
objective(z, ntimes)

t = (0:0.001:T)';
tnum = length(t);
[x0, x1, x2, x3, xnum] = getx(z);
y = x1 + x2 + x3;
h = S ./ (x1 / 2 + x2 + x3 / 2);

nmax = min(floor((T - x0)./(y + r)), Nmax);

figure;
plot(xub, ub, 'k', t, onewavevector(x0(1), x1(1), x2(1), x3(1), h(1), r(1), t, nmax(1)), 'g', t, onewavevector(x0(2), x1(2), x2(2), x3(2), h(2), r(2), t, nmax(2)), 'r', t, wavesum(x0, x1, x2, x3, h, r, t, xnum, tnum, nmax), 'b');
axis([0, T, 0, 1.2 * max(ub)]);
legend('1', '2', '3', '4');
xlabel('t (s)');
ylabel('p (kW)');

floor((T - x0)./(y + r))

clear
load parameter

Nmax(1) = 1000;
Nmin(2) = 0;
save parameter