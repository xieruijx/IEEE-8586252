function [p, pg] = initp(zyo, pgo, wminn, xubn, ubn, ntimes)
load parameter

m = ones(N, 1);
p = zeros(N, 1);
pz = testlim(zyo', S, im, imm, T, Nmin, wminn, r);
for i = 1: N
    if pz(i)
        m(i) = wavemax(zyo(i, :)', S, r, T, xubn, ubn, Nmax);
    end
end

oo = ofun(zyo', ntimes);
fz = (oo < p) & (m <= 0) & pz;
p(fz) = oo(fz);

[minp, minindex] = min(p);
if minp < 0
    pg = zyo(minindex, :);
else
    pg = pgo;
    pg(1: n) = pg(1: n) + wminn';
end