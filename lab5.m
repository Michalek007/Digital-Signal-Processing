clear; clc; close all;

fs = 10000;
fo = 4000;



Ts = 1 / fs;
N = 10;

an = zeros(size(N));
ts = [];
for n=1:N
    an(n) = sin(2*pi*fo*(n-1)*Ts);
    ts = [ts, (n-1)*Ts];
end

bn = zeros(size(N));
ts = [];
for n=1:N
    bn(n) = cos(2*pi*fo*(n-1)*Ts+pi/2);
    ts = [ts, (n-1)*Ts];
end


cn = zeros(size(N));
ts = [];
for n=1:N
    cn(n) = sin(2*pi*fo*(n-1)*Ts) + cos(2*pi*fo*(n-1)*Ts+pi/2);
    ts = [ts, (n-1)*Ts];
end

ak = fft(an);
ak = fftshift(ak);

bk = fft(bn);
bk = fftshift(bk);

ckk = ak+bk;
fx = (-N/2:N/2-1)*(fs/N);

figure(1)
stem(fx, abs(ckk), 'r'); grid on; title('Abs'); hold on;
%figure(2)
%stem(fx,angle(ckk)); grid on;



ck = fft(cn);
ck = fftshift(ck);
fx = (-N/2:N/2-1)*(fs/N);
figure(2)
stem(fx, abs(ck), 'r'); grid on; title('Abs'); hold on;

figure(3)
stem(fx, abs(ck-ckk)); grid on;
%figure(4)
%stem(fx,angle(ck)); grid on;


