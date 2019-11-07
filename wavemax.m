function m = wavemax(z, S, r, T, xub, ub, Nmax)
[x0, x1, x2, x3, xnum] = getx(z);
y = x1 + x2 + x3;
h = S ./ (x1 / 2 + x2 + x3 / 2);
nT = max(floor((T - x0) ./ (y + r)), zeros(size(x0)));

% 上左顶点
Nt1 = nT;
n1 = x0 + nT .* (y + r) + x1 < T;
Nt1(n1) = Nt1(n1) + 1;
Nt1 = min(Nt1, Nmax);

t1set = zeros(sum(Nt1), 1);
n = 1;
for i = 1: xnum
    t1set(n: n + Nt1(i) - 1) = x0(i) + x1(i) + (0: (Nt1(i) - 1)) * (y(i) + r(i));
    n = n + Nt1(i);
end

% 上右顶点
Nt2 = nT;
n2 = x0 + nT .* (y + r) + x1 + x2 < T;
Nt2(n2) = Nt2(n2) + 1;
Nt2 = min(Nt2, Nmax);

t2set = zeros(sum(Nt2), 1);
n = 1;
for i = 1: xnum
    t2set(n : n + Nt2(i) - 1) = x0(i) + x1(i) + x2(i) + (0: (Nt2(i) - 1)) * (y(i) + r(i));
    n = n + Nt2(i);
end

tset = [t1set; t2set; xub; T];
tnum = length(tset);

[m, ~] = max(wavesum(x0, x1, x2, x3, h, r, tset, xnum, tnum, Nmax) - interp1(xub, ub, tset));
if isempty(m)
    m = 0;
end