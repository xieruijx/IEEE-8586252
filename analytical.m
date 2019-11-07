function z = analytical()
load parameter
C = (min(ub) + 2 * sum(S./ r)) / sum(sqrt(S .* f) ./ r);
h = (C * sqrt(S .* f) - 2 * S) ./ r;
if min(h) <= 0
    h = min(ub) / n;
end
x0 = wmin;
x1 = h ./ im;
x3 = h ./ imm;
x2 = max(S ./ h - x1 / 2 - x3 / 2, 0);
z = [x0; x1; x2; x3];