function [z, v, zy, pg, p] = PSOinit()
load parameter

ntimes = zeros(n, 1);

z0 = analytical();
[~, x10, x20, x30] = getx(z0);
h0 = S ./ (x10 / 2 + x20 + x30 / 2);

unfeasible = true;
while unfeasible

z = zeros(N, 4 * n);
z(:, 1: n) = ones(N, 1) * wmin' + ones(N, 1) * r' .* rand(N, n);
z(:, (n + 1): (2 * n)) = ones(N, 1) * (h0 ./ im)' + rr * rand(N, n);
z(:, (3 * n + 1): (4 * n)) = ones(N, 1) * (h0 ./ imm)' + rr * rand(N, n);
z(:, (2 * n + 1): (3 * n)) = (ones(N, 1) * S' / max(ub)) + (ones(N, 1) * x20' - ones(N, 1) * S' / max(ub)) .* rand(N, n) + rr * rand(N, n);

v = rand(N, 4 * n);
pg = zeros(1, 4 * n);
% minp = 0;
p = zeros(N, 1);
zy = z;

pz = testlim(z', S, im, imm, T, Nmin, wmin, r);
if ~all(pz == 0)
    m = ones(N, 1);
    for i = 1: N
        if pz(i)
            m(i) = wavemax(z(i, :)', S, r, T, xub, ub, Nmax);
        end
    end
    oo = ofun(z', ntimes);
    fz = (oo < p) & (m <= 0) & pz;
    if ~all(fz == 0)
        p(fz) = oo(fz);
        zy(fz, :) = z(fz, :);
        [~, minindex] = min(p);
        pg = z(minindex, :);
        return
    end
end
    
end


% 
%     unfeasible = true;
% %     tnum = 0;
%     while unfeasible 
% %         tnum = tnum + 1;
%         z(1, :) = z(1, :) + rr * (rand(1, 4 * n) - 0.5);
%         if min(z(1, :)) > T
%             continue
%         elseif ~testlim(z(1, :)', S, im, imm, T, Nmin, wmin, r)
%             continue
%         else
%             m = wavemax(z(1, :)', S, r, T, xub, ub, Nmax);
%             if m > 0
%                 continue
%             else
%                 break
%                 unfeasible = false;
%             end
%         end
%     end
%     ofunz = ofun(z(1, :)', ntimes);
%     if ofunz < minp
%         pg = z(1, :);
%         p(1) = ofunz;
% %         break
%     end
% % end
% 
% zy = z;
% % wavemax(pg', S, r, T, xub, ub, Nmax)