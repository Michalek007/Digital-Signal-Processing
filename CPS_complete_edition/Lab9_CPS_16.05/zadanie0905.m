clc; clear; close all;

[x,fs]=CPS_LAB08_sygnal(3);

N = length(x);

Pw = sum(boxcar(N))/sum(blackman(N))

K = 2^16;
xZ = [x, zeros(1,K-N)];

Dt = 1/fs;
t=0:Dt:Dt*N-Dt;

figure(1);
stem(t,x,"r");

X = fft(x);
XZ = fft(xZ);

Df = fs/N;
M = length(xZ);
DfZ = fs/M;

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
plot(f_shiftedZ,fftshift(abs(XZ)/N),"g.");hold on;
stem(f_shifted,fftshift(abs(X)/N),"m");
subplot(2,1,2);
plot(f_shiftedZ,fftshift(angle(XZ)/pi),"g.");hold on;
stem(f_shifted,fftshift(angle(X)/pi),"m");

xWin = x(:) .* blackman(N);
xZWin = [xWin; zeros(K-N,1)];
XWIN = fft(xWin);
XZWIN = fft(xZWin);

figure(3);
plot(f_shiftedZ, fftshift(abs(XZWIN)/N*Pw),"b."); hold on;
stem(f_shifted,fftshift(abs(XWIN)/N*Pw),"mo"); xlim([0,300]);
%plot(f_shiftedZ, fftshift(abs(XKZWIN)/N*2),"b."); hold on;
%stem(f_shifted,fftshift(abs(XKWIN)/N*2),"mo");
%plot([f0 f0],get(gca,'ylim'),'k--')
figure(4);
plot(f_shiftedZ, fftshift(angle(XZWIN)/pi),"b."); hold on;
stem(f_shifted,fftshift(angle(XWIN)/pi),"mo"); xlim([0,300]);
%plot([f0 f0],get(gca,'ylim'),'k--')