clc; clear; close all;

fs = 3000;
N = 15;
Dt = 1/fs;
T = N*Dt;
t0 = 0;

dt = 0.00001; t = t0-T/3:dt:T+T/3;
f0 = 666;

Df = fs/N;

ts = t0:Dt:Dt*N-Dt;

s = sin(2*pi*f0*t);
xn = sin(2*pi*f0*ts);
xnWin = xn(:) .* blackman(N);
% xnWin = xn(:) .* bartlett(M);
xnZ = [xn, zeros(1,5000)];
xnZWin = [xnWin; zeros(5000,1)];
M = length(xnZ);

DfZ = fs/M;

figure(1);
plot(t,s, "r-"); hold on;
stem(ts,xn,"b.");

XK = calcDFT(xn);
XKZ = calcDFT(xnZ);
XKWIN = calcDFT(xnWin);
XKZWIN = calcDFT(xnZWin);

df = 1;
f = -fs:df:fs;

if (mod(N,2) == 0)
    f_shifted = -fs/2:Df:fs/2-Df;
else
    f_shifted = -fs/2+Df/2:Df:fs/2-Df/2;
end

if (mod(M,2) == 0)
    f_shiftedZ = -fs/2:DfZ:fs/2-DfZ;
else
    f_shiftedZ = -fs/2+DfZ/2:DfZ:fs/2-DfZ/2;
end

figure(2);
subplot(2,1,1);
plot(f_shiftedZ, fftshift(abs(XKZ)/N),"b."); hold on;
stem(f_shifted,fftshift(abs(XK)/N),"mo");
plot([f0 f0],get(gca,'ylim'),'k--')
subplot(2,1,2);
plot(f_shiftedZ, fftshift(angle(XKZ)/pi),"b."); hold on;
stem(f_shifted,fftshift(angle(XK)/pi),"mo");
plot([f0 f0],get(gca,'ylim'),'k--')

figure(3);
subplot(2,1,1);
% plot(f_shiftedZ, fftshift(abs(XKZWIN)/N*2.3833),"b."); hold on;
% stem(f_shifted,fftshift(abs(XKWIN)/N*2.3833),"mo");
plot(f_shiftedZ, fftshift(abs(XKZWIN)/N*2),"b."); hold on;
stem(f_shifted,fftshift(abs(XKWIN)/N*2),"mo");
plot([f0 f0],get(gca,'ylim'),'k--')
subplot(2,1,2);
plot(f_shiftedZ, fftshift(angle(XKZWIN)/pi),"b."); hold on;
stem(f_shifted,fftshift(angle(XKWIN)/pi),"mo");
plot([f0 f0],get(gca,'ylim'),'k--')

figure(4); hold on, grid on
plot(f_shiftedZ, 20*log10(fftshift(abs(XKZ)/N)),"r.");
plot(f_shiftedZ, 20*log10(fftshift(abs(XKZWIN)/N*2.3833)),"g.");
plot([f0 f0],get(gca,'ylim'),'k--')



