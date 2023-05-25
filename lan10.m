clc; clear; close all;
fp = 1250;
fr = 1750;
Rp = 2;
Rr = 43;
fs = 8000;
% iir_1;

N = ceil(log10(sqrt(10^(Rr/10)-1)/sqrt(10^(Rp/10)-1))/log10(fr/fp));
fo = (fr/power(10^(Rr/10)-1 ,1/(2*N)) + fp/power(10^(Rp/10)-1 ,1/(2*N)))/2;
za = [];
k = 1:N;
pa = 2*pi*fo*exp(j*pi*(0.5+(2*k-1)/(2*N)));
ka = abs(cumprod(pa));
ka = ka(end);
[ba,aa] = zp2tf(za,pa,ka);
[Ha,Fa] = freqs(ba,aa,2*pi*linspace(0,fs,5000));
% iir_2;
Ts = 1/fs;
[r,p,K] = residue(ba,aa);
licznik = Ts*r;
mianownik = exp(Ts*p);
[b1,a1] = residue(licznik,mianownik,K);
b1 = real(b1);
Q = 10000;
[H1,F1] = freqz(b1,a1,Q,fs);
% iir_3;

% figure(5);
% zplane(ba,aa); grid on;
% figure(6);
% zplane(b1,a1); grid on;
% fr = fs/pi * tan(fr/fs * pi);
% fp = fs/pi * tan(fp/fs * pi);
% pc = (1+pa*Ts/2)./(1-pa*Ts/2);
% zc = (1+za*Ts/2)./(1-za*Ts/2);
% zc = [zc,-1.*ones(1,abs((length(zc)-length(pc))))];
% kdd = 1;
% for n = 1:length(za)
%     kdd = kdd*(2*fs - za(n))/(2*fs - pa(n));
% end
% kc = kdd*ka;
% zc = zc';
% [b2,a2] = zp2tf(zc,pc,kc);
% Q = 10000;
% [H2,F2] = freqz(b2,a2,Q,fs);
% iir_4;