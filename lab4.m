clear; clc; close all;

fs = 10000;
fo = 3000;


t = linspace(0, 0.5, 5e5);
x = 1/4 + sin(2*pi*fo*t);
Ts = 1 / fs;
N = 10;

xn = zeros(size(N));
ts = [];
for n=1:N
    xn(n) = 1/4 + sin(2*pi*fo*(n-1)*Ts);
    ts = [ts, (n-1)*Ts];
end    
czas_trwania = 10 * Ts;

%plot(t, x, 'r'); grid on; hold on; xlim([0 czas_trwania])
%stem(ts, xn, 'b');

xk = x_dft(xn, Ts);
xk_test = fft(xn) /fs;

xnn = x_idft(xk_test, fs/10);
xnn_test = ifft(xk_test);

fx = 0:N-1;

figure(1)
stem(fx, abs(xk), 'r'); grid on; title('Abs'); hold on;
stem(fx, abs(xk_test), 'b');

figure(2)
stem(fx, angle(xk), 'r'); grid on; title('Phase'); hold on;
stem(fx, angle(xk_test), 'b'); grid on;

% figure(3)
% stem(fx, abs(xk), 'r'); grid on; title('Our method (abs)');
% 
% figure(4)
% stem(fx, abs(xk_test), 'b'); grid on; title('Matlab method (abs)');

%stem(fx, xk_test, 'b');
%abs(xk - xk_test)

% xnn = x_idft(xk, fs)/10;

xn - xnn_test
xn - xnn
