function [wminn, ntimes] = cwmin(z, t, r)
[x0, x1, x2, x3] = getx(z);
T = x1 + x2 + x3 + r;
ntimes = max(ceil((t - x0) ./ T), 0);
wminn = zeros(size(x0));
tw = x0 + ntimes .* T;
wminn(ntimes > 0) = tw(ntimes > 0);
wminn(ntimes == 0) = t;