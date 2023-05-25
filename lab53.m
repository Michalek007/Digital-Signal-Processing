clear; clc; close all;

fs = 10;
fo = 4;



Ts = 1 / fs;
N = 20;

an = zeros(size(N));
ts = [];
for n=1:N
    an(n) = sin(2*pi*fo*(n-1)*Ts);
    ts = [ts, (n-1)*Ts];
end
t = -5:0.001:5;
f = 100*t;
ann = sin(2*pi*fo*t);
ann_f = fft(ann);
ak = fft(an);
ak = fftshift(ak);
fx = (-N/2:N/2-1)*(fs/N);
figure(1)
%stem(fx,abs(ak),'r'); grid on; hold on;
plot(f,abs(ann_f),'b');