clc; clear; close all;

%fdp butterworth

fp = 1250; fr = 1750; fs = 8000;
Rp = 2; Rr = 50;

N = ceil(log10(sqrt(10^(Rr/10)-1)/(sqrt(10^(Rp/10)-1)))/log10(fr/fp));

fi = (fp+fr)/2;
Ri = (Rp+Rr)/2;

f0 = fi/(10^(Ri/10)-1)^(1/(2*N));

k = 1:N;

za = [];
pa = 2*pi*f0*exp(j*pi*(1/2+(2*k-1)/(2*N)));
ka = abs(prod(pa));

[ba, aa] = zp2tf(za,pa,ka);

iir_1;
[Ha, Fa] = freqs(ba, aa, 2*pi*linspace(0,fs,5e+3));
iir_2;

Ts = 1/fs;

[r,p,K] = residue(ba,aa);

licz = Ts*r;
mian = exp(Ts*p);

[b1,a1] = residue(licz,mian,K);

Q = 10000;

[H1, F1] = freqz(b1,a1,Q,fs);
iir_3;

ha = odp_imp_2(ba,aa,50);
h1 = odp_imp_2(b1,a1,50);

figure(5);
stem(h1,'r');

figure(6);
zplane(ba,aa);
figure(7);
zplane(b1,a1);

K = 50;

fs=8000; Dt = 1/fs;
tx = 0:Dt:K*Dt-Dt;
xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);

y = conv(xs,h1);

figure(9);
subplot(3,1,1);
stem(xs,"r");title("x");
subplot(3,1,2);
stem(h1,"b");title("h");
subplot(3,1,3);
stem(y,"g");title("y");

Df = fs/K;
f = 0:Df:Df*K-Df;

H = fft(h1);
X = fft(xs);
Y = X.*H;

figure(10);
subplot(3,1,1); 
stem(f,abs(X),"r");xlim([0,fs/2]); title("X");
subplot(3,1,2);
stem(f,abs(H),"b");xlim([0,fs/2]);title("H");
subplot(3,1,3);
stem(f,abs(Y),"g");xlim([0,fs/2]);title("Y");
