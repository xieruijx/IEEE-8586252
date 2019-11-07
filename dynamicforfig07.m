% 循环
clc
clear
close all
load parameter

Mt = 2000;
tinit = 50;

tset = (0:0.001:T)';
tnum = length(tset); % 时间分点数
ntimes = zeros(n, 1);
Tnum = T / dt;

t = 0;
tic
[zo, vo, zyo, pgo, po] = PSOinit();
toc

oS = zeros(Tnum, 1);
ntimesnsumS = zeros(n, Tnum);
ntimesnsum = zeros(n, 1);

pgS = zeros(4 * n, Tnum);

oS(1) = objective(pgo', ntimesnsum);
pgS(:, 1) = pgo';

[wminn, ntimesn] = cwmin(pgo', dt, r);
[tcset, y1set, y2set, y3set] = waveload(pgo', S, r, T, xub, ub, zeros(size(xub)), ntimesn);



wminp = wmin;

figure;
plot(tcset, y3set);
hold on

for i = 1: (Tnum - 1)
    ntimesnsum = ntimesnsum + ntimesn;
    ntimesnsumS(:, i + 1) = ntimesnsum;
%     size(wminn)
    wmind = wminn - wminp;
    
    zo(:, 1: n) = zo(:, 1: n) + ones(N, 1) * wmind';
    zyo(:, 1: n) = zyo(:, 1: n) + ones(N, 1) * wmind';
    [poo, pgoo] = initp(zyo, pgo, wmin + wminn, tcset, y2set, ntimes);
    [zm, fv, z, v, zy, pg, p, pbeset] = PSOiter(zo, vo, zyo, pgoo, poo, wmin + wminn, tcset, y2set, ntimes, Mt);
    
    
    
    
%     figure;
%     plot(tset, interp1(tcset, y2set, tset));
%     axis([0, T, 0, 1.2 * max(ub)]);
    
%     [x0, x1, x2, x3, xnum] = getx(zm);
%     y = x1 + x2 + x3;
%     h = S ./ (x1 / 2 + x2 + x3 / 2);
%     figure;
%     plot(tset, wavesum(x0, x1, x2, x3, h, r, tset, xnum, tnum, Nmax));
%     axis([0, T, 0, 1.2 * max(ub)]);

    zo = z;
    vo = v;
    zyo = zy;
    pgo = pg;
    po = p;
    pgS(:, i + 1) = pgo';
    oS(i + 1) = objective(pgo', ntimesnsum);
    
    t = t + dt;
    wminp = wminn;
    [wminn, ntimesn] = cwmin(pgo', t + dt, r);
    [tcset, y1set, y2set, y3set] = waveload(pgo', S, r, T, tcset, y2set, y3set, ntimesn);
    
    plot(tcset, y3set);
    hold on
end

plot(xub, ub, 'k');
legend('1','2','3','4','5','6');
save('prepgS', 'pgS', 'oS');