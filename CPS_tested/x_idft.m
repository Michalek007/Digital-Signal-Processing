function y = x_idft(x)
N = length(x);
y = [];

for k = 0:N-1
    xx = 0;
    for n = 0:N-1
        xx = xx + x(n+1)*exp(-1i*2*pi*(-k*n)/N);
     end
    y = [y, xx];
end
y = y .* (1/N);
end