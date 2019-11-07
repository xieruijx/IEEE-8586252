function [zm, fv, z, v, zy, pg, p, pbeset] = PSOiter(zo, vo, zyo, pgo, po, wminn, xubn, ubn, ntimes, Mt)
format long
tic;
load parameter

z = zo;
v = vo;
zy = zyo;
pg = pgo;
m = ones(N, 1);
p = po;

pbeset = zeros(Mt, 1);

for t = 1: Mt
%     t
    v = w * v + c1 * rand(N, 4 * n) .* (zy - z) + c2 * rand(N, 4 * n) .* (ones(N, 1) * pg - z);
    z = z + v;
    pz = testlim(z', S, im, imm, T, Nmin, wminn, r);
    for i = 1: N
        if pz(i)
            m(i) = wavemax(z(i, :)', S, r, T, xubn, ubn, Nmax);
        end
    end

    oo = ofun(z', ntimes);
    fz = (oo < p) & (m <= 0) & pz;
    p(fz) = oo(fz);
    zy(fz, :) = z(fz, :);
    [minp, minindex] = min(p);
    if minp < 0
        pg = zy(minindex, :);
        pbeset(t) = minp;
    else
        pbeset(t) = ofun(pg', ntimes);
    end
end
toc;


zm = pg';
% wavemax(zm, S, r, T, xub, ub, Nmax)
fv = pbeset(Mt);

% t = 1: Mt;
% figure;
% plot(t, - pbeset);
% xlabel('Iteration Number');
% ylabel('Objective Value');
% save('pbeset', 'pbeset');
