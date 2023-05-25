clc; clear; close all;

fp = 1250;
fr = 1750;
fs = 8000;
Rr = 50;
f0 = (fp+fr)/2;

% okno hamminga

a = 3.3;
%a = 5.6;

R = ceil(a*fs/(fr-fp));
K = R+1;

%Df = 100;
%M = fs/Df;
%while(M<2*K)
%    M = 2*M;
%end

M = 8*K;
L = (M-2)/2;

Df = fs/M;
f = 0:Df:M*Df-Df;

o = floor(f0/Df);

HM = [1,ones(1,o-1),1/2,zeros(1,L-o),0,zeros(1,L-o),1/2,ones(1,o-1)];
hx = fftshift(ifft(HM));

%hx = hx(floor(K/2)+1:floor(K/2)+K);
hx = hx(floor(M/2)-floor(K/2)+1:floor(M/2)+floor(K/2));

h = hx(:).*hamming(K);
%h = hx(:).*blackman(K);

n = 0:R;

figure(4);
subplot(2,1,1);
stem(f,HM,"b.");
subplot(2,1,2);
stem(h,"r.");

%fir_1;
[H2 F2] = freqz(h,1,K*200,fs);
%fir_4;

figure(1);
stem(f,abs(HM),"kd","fill");

mode = 1;
switch(mode)
    case 1
        fs=8000; Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 2
        fs=16000;Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 3
        fs=4000;Dt = 1/fs;
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx);
end

y = conv(h,xs);

figure(6);
subplot(3,1,1);
stem(xs,"r.");hold on; title("x");
subplot(3,1,2);
stem(h,"b.");title("h");
subplot(3,1,3);
stem(y,"g.");title("y");

Df = fs/K;
f = 0:Df:Df*K-Df;

H = fft(h);
X = fft(xs);
Y = X(:).*H;

figure(7);
subplot(3,1,1);
stem(f,abs(X),"r.");hold on; xlim([0,fs/2]);title("X");
subplot(3,1,2);
stem(f,abs(H),"b.");xlim([0,fs/2]);title("H");
subplot(3,1,3);
stem(f,abs(Y),"g.");xlim([0,fs/2]);title("Y");

%hGP = h.'.*cos(pi*(n-R/2));
hGP = sinc(n-R/2-1/2) - h.';

HGP = fft(hGP);

figure(8);
subplot(3,1,1);
stem(n,h,"b.");
subplot(3,1,2);
stem(n,hGP,"r.");
subplot(3,1,3);
stem(f,abs(H),"b."); hold on;
stem(f,abs(HGP),"r.");