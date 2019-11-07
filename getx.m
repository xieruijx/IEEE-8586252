function [x0, x1, x2, x3, Nw] = getx(z)
[Nw, ~] = size(z);
Nw = Nw / 4;
x0 = z(1: Nw, :);
x1 = z((Nw + 1) : (2 * Nw), :);
x2 = z((2 * Nw + 1) : (3 * Nw), :);
x3 = z((3 * Nw + 1) : (4 * Nw), :);