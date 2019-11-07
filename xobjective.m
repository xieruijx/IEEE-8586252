function fv = xobjective(z, ntimes)
load parameter
[x0, x1, x2, x3] = getx(z);
[~, m] = size(z);
times = min(floor((T - x0) ./ (x1 + x2 + x3 + r * ones(1, m))) + ntimes * ones(1, m), Nmax * ones(1, m));
fv = - sum(f * ones(1, m) .* times, 1)';