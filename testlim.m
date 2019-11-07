function lim = testlim(z, S, im, imm, T, Nmin, wmin, r)
% z �Ǿ���ÿһ����һ����
[x0, x1, x2, x3] = getx(z);
[~, znum] = size(z);
h = S * ones(1, znum) ./ (x1 / 2 + x2 + x3 / 2);
T1 = x1 + x2 + x3 + r * ones(1, znum);
lim = all(h <= x1 .* (im * ones(1, znum)), 1) & all(h <= x3 .* (imm * ones(1, znum)), 1); % б��
lim = lim & all(x0 + T1 .* (Nmin * ones(1, znum)) <= T); % ��������
zmin = min(z, [], 1);
lim = lim & (zmin >= 0) & (zmin <= T); % ��������
lim = lim & all(x0 >= wmin * ones(1, znum)); % ����ʱ������
lim = lim';