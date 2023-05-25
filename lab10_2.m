clc; clear; close all;
fp = 1250;
fr = 1750;
Rp = 2;
Rr = 43;
fs = 8000;
Ts = 1/fs;
fr_a = fs/pi * tan(fr/fs * pi);
fp_a = fs/pi * tan(fp/fs * pi);
iir_1;
N = ceil(log10(sqrt(10^(Rr/10)-1)/sqrt(10^(Rp/10)-1))/log10(fr/fp));
fo = (fr_a/power(10^(Rr/10)-1 ,1/(2*N)) + fp_a/power(10^(Rp/10)-1 ,1/(2*N)))/2;
za = [];
k = 1:N;
pa = 2*pi*fo*exp(j*pi*(0.5+(2*k-1)/(2*N)));
ka = abs(cumprod(pa));
ka = ka(end);

[ba,aa] = zp2tf(za,pa,ka);
[Ha,Fa] = freqs(ba,aa,2*pi*linspace(0,fs,5000));
iir_2;

pc = (1+pa*Ts/2)./(1-pa*Ts/2);
zc = (1+za*Ts/2)./(1-za*Ts/2);
zc = [zc,-1.*ones(1,abs((length(zc)-length(pc))))];
kdd = 1;
for n = 1:length(za)
    kdd = kdd*(2*fs - za(n))/(2*fs - pa(n));
end
kc = kdd*ka;
zc = zc';
[b2,a2] = zp2tf(zc,pc,5e-7);
Q = 10000;
[H2,F2] = freqz(b2,a2,Q,fs);
iir_4;
figure(4)
zplane(b2,a2);
%[ba,aa] = zp2tf(za,pa,ka);