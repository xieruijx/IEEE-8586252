function w = wavesum(x0, x1, x2, x3, h, r, t, xnum, tnum, Nmax)
w = zeros(tnum, xnum);
for i = 1: xnum
    w(:, i) = onewavevector(x0(i), x1(i), x2(i), x3(i), h(i), r(i), t, Nmax(i));
end
w = sum(w, 2);
