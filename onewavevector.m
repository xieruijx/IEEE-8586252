function w = onewavevector(x0, x1, x2, x3, h, r, t, Nmaxi)
t(t <= x0) = x0;
y = x1 + x2 + x3;
T = y + r;
t = t - x0;

t(t > Nmaxi * T) = 0;

t = t - floor(t / T) * T;
w = zeros(size(t));
w(t > y) = 0;
index = (t >= x1) & (t <= x1 + x2);
w(index) = h;
index = t < x1;
w(index) = t(index) / x1 * h;
index = (t > x1 + x2) & (t < y);
w(index) = (y - t(index)) / x3 * h;