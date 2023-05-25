clear; clc; close all;

fs = 10000;
fo = 4000;


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
czas_trwania = N * Ts;

% plot(t, x, 'r'); grid on; hold on; xlim([0 czas_trwania])
% stem(ts, xn, 'b');

xk = x_dft(xn, Ts);
xk_test = fft(xn);

xnn = x_idft(xk, fs/N);
xnn_test = ifft(xk_test);

fx = (0:N-1)*(fs/N);

% figure(1)
% stem(fx, abs(xk), 'r'); grid on; title('Abs'); hold on;
% stem(fx, abs(xk_test), 'b');
%
% figure(2)
% stem(fx, angle(xk), 'r'); grid on; title('Phase'); hold on;
% stem(fx, angle(xk_test), 'b'); grid on;

% figure(3)
% stem(fx, abs(xk), 'r'); grid on; title('Our method (abs)');
%
% figure(4)
% stem(fx, abs(xk_test), 'b'); grid on; title('Matlab method (abs)');

%stem(fx, xk_test, 'b');
%abs(xk - xk_test)

%xnn = x_idft(xk, fs)/10;

% xn - xnn_test;
% xn - xnn;
% figure(3)
% stem(ts ,abs(xn-xnn)); grid on; hold on;
% stem(ts, abs(xnn - xnn_test)); grid on;


%parzysta ilość próbek
N = 10;
xn = zeros(size(N));
ts = [];
for n=1:N
xn(n) = 1/4 + sin(2*pi*fo*(n-1)*Ts);
ts = [ts, (n-1)*Ts];
end
xk = fft(xn);
xk = fftshift(xk);
fx = (-N/2:N/2-1)*(fs/N);
figure(1)
stem(fx, abs(xk), 'r'); grid on; title('Abs'); hold on;
figure(2)
stem(fx,angle(xk)); grid on;

% N = 50;
% xn = zeros(size(N));
% ts = [];
% for n=1:N
% xn(n) = 1/4 + sin(2*pi*fo*(n-1)*Ts);
% ts = [ts, (n-1)*Ts];
% end
% xk = x_dft(xn, Ts);
% fx = (0:N-1)*(fs/N);
% figure(2)
% stem(fx, abs(xk), 'r'); grid on; title('Abs'); hold on;
% 
% N = 100;
% xn = zeros(size(N));
% ts = [];
% for n=1:N
% xn(n) = 1/4 + sin(2*pi*fo*(n-1)*Ts);
% ts = [ts, (n-1)*Ts];
% end
% xk = x_dft(xn, Ts);
% fx = (0:N-1)*(fs/N);
% figure(3)
% stem(fx, abs(xk), 'r'); grid on; title('Abs'); hold on;

%nieparzysta ilość próbek

N = 15;
xn = zeros(size(N));
ts = [];
for n=1:N
xn(n) = 1/4 + sin(2*pi*fo*(n-1)*Ts);
ts = [ts, (n-1)*Ts];
end
xk = fft(xn);
xk = fftshift(xk);
fx = (-(N-1)/2:(N-1)/2)*(fs/N);
figure(3)
stem(fx, abs(xk), 'r'); grid on; title('Abs'); hold on;
figure(4)
stem(fx,angle(xk)); grid on;

% N = 45;
% xn = zeros(size(N));
% ts = [];
% for n=1:N
% xn(n) = 1/4 + sin(2*pi*fo*(n-1)*Ts);
% ts = [ts, (n-1)*Ts];
% end
% xk = x_dft(xn, Ts);
% fx = (0:N-1)*(fs/N);
% figure(5)
% stem(fx, abs(xk), 'r'); grid on; title('Abs'); hold on;
% 
% N = 75;
% xn = zeros(size(N));
% ts = [];
% for n=1:N
% xn(n) = 1/4 + sin(2*pi*fo*(n-1)*Ts);
% ts = [ts, (n-1)*Ts];
% end
% xk = x_dft(xn, Ts);
% fx = (0:N-1)*(fs/N);
% figure(3)
% stem(fx, abs(xk), 'r'); grid on; title('Abs'); hold on;