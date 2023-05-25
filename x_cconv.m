function y = x_cconv(h, x)
% splot kolowy
N = length(h) + length(x) - 1;
Nh = length(h);
Nx = length(x);
h = [h, zeros([1,N-Nh])];
x = [x, zeros([1,N-Nx])];
y = ifft(fft(x).*fft(h));
y = y(1:N);
end