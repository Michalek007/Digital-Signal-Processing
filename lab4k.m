clc; clear; close all;
% dft i szereg fouriera

x = randi(5, 1, 5)

y_m = fft(x);

y_m

y = x_dft(x);

y

e = sum(abs(y_m - y));
e

x_idft_m = ifft(x);

x_idft_m

x_idft = x_idft(x);

x_idft

e = sum(abs(x_idft_m - x_idft));
e