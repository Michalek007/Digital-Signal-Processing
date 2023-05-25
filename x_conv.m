function y = x_conv(h, x)

N = length(h) + length(x) - 1;
Nh = length(h);
Nx = length(x);

for n = 1:N-Nh
    h = [0, h];
end
for n = 1:N-Nx
    x = [0, x];
end

x = x(end:-1:1);
x = x.';
y = zeros(1, N);
for n=1:N
    y(n) = h * x;
    x = x.';
    x = [x(end), x];
    x = x.';
    x(end) = [];
end
end
