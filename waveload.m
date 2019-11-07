function [tcset, y1set, y2set, y3set] = waveload(z, S, r, T, xub, ub, load, ntimesn)
[x0, x1, x2, x3, xnum] = getx(z);
y = x1 + x2 + x3;
h = S ./ (x1 / 2 + x2 + x3 / 2);

t1set = zeros(sum(ntimesn), 1);
t2set = zeros(sum(ntimesn), 1);
t3set = zeros(sum(ntimesn), 1);
t4set = zeros(sum(ntimesn), 1);
n = 1;
for i = 1: xnum
    t1set(n: n + ntimesn(i) - 1) = x0(i) + (0: (ntimesn(i) - 1)) * (y(i) + r(i));
    t2set(n: n + ntimesn(i) - 1) = x0(i) + x1(i) + (0: (ntimesn(i) - 1)) * (y(i) + r(i));
    t3set(n: n + ntimesn(i) - 1) = x0(i) + x1(i) + x2(i) + (0: (ntimesn(i) - 1)) * (y(i) + r(i));
    t4set(n: n + ntimesn(i) - 1) = x0(i) + x1(i) + x2(i) + x3(i) + (0: (ntimesn(i) - 1)) * (y(i) + r(i));
    n = n + ntimesn(i);
end

tcset = [0; t1set; t2set; t3set; t4set; xub; T];
tcset = unique(tcset);
tnum = length(tcset);
y1set = wavesum(x0, x1, x2, x3, h, r, tcset, xnum, tnum, ntimesn);
y2set = interp1(xub, ub, tcset) - y1set;
y3set = interp1(xub, load, tcset) + y1set;

% [~, I] = sort(tcset);
% tcset = tcset(I);
% y1set = y1set(I);
% y2set = y2set(I);