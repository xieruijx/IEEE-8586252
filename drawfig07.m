clear
close all
load parameter

load pgS

[~, Tnum] = size(pgS);



% 画y1set，即单次功率
figure;
plot([T, T], [0, 5000], 'k--');
hold on
plot([T, T], [0, 5000], 'k-.');
hold on
plot([T, T], [0, 5000], 'k-');
hold on
plot([T, T], [0, 5000], 'k:');
hold on
legend('P_A(t)', '单个解的作用','P_S(t)', 'P_1(t)');


tcset = xub;
y2set = ub;
y3set = zeros(size(xub));
% figure;
plot(xub,ub, 'k--');
% legend('P_A(t)');
hold on
for i = 1: Tnum
    pgo = pgS(:, i)';
    [wminn, ntimesn] = cwmin(pgo', dt * i, r);
    [tcset, y1set, y2set, y3set] = waveload(pgo', S, r, T, tcset, y2set, y3set, ntimesn);
    plot(tcset, y1set, 'k-.');
    hold on
end
% plot(tcset, y3set, 'k:');
hold on


k = 4;
tcset = xub;
y2set = ub;
y3set = zeros(size(xub));
for i = 1: Tnum
    pgo = pgS(:, i)';
%     testlim(pgo', S, im, imm, T, Nmin, wmin)
    [x0, x1, x2, x3] = getx(pgo');
%     h = S ./ (x1 / 2 + x2 + x3 / 2);
%     h ./ x1 < im
%     h ./ x3 < imm
    pgo = [x0(k),x1(k),x2(k),x3(k)];
%     testlim(pgo', S(k), im(k), imm(k), T, Nmin(k), wmin(k))
    [wminn, ntimesn] = cwmin(pgo', dt * i, r(k));
    [tcset, y1set, y2set, y3set] = waveload(pgo', S(k), r(k), T, tcset, y2set, y3set, ntimesn);
end
plot(tcset, y3set, 'k:')

axis([0, T, 0, 1.2 * max(ub)]);

% 画y3set，即总功率
tcset = xub;
y2set = ub;
y3set = zeros(size(xub));
% figure;
for i = 1: Tnum
%     dt * i
    pgo = pgS(:, i)';
    [wminn, ntimesn] = cwmin(pgo', dt * i, r);
    [tcset, y1set, y2set, y3set] = waveload(pgo', S, r, T, tcset, y2set, y3set, ntimesn);
%     plot(tcset, y3set, 'k-');
    hold on
end
plot(tcset, y3set, 'k-');
axis([0, T, 0, 1.5 * max(ub)]);

save fig07result