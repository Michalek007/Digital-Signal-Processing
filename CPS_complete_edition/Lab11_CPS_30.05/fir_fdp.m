clc; clear; close all;

fp=1250; fr=1750; fs=8000; Rr=50;

f0 = (fp+fr)/2;

% okno hamminga Rr=-53
a = 3.3;

Rmin = a*(fs/(fr-fp));
R = ceil(Rmin);

K = R+1;

df = 0.1;
f=-50:df:50;

dt = 0.0001;
t = 0:dt:R;
tx = 0:1:R;

H = xpi(f/(2*f0/fs)).*exp(-j*2*pi*f*R/2);
hst = 2*f0/fs*sinc(2*f0/fs*(t-R/2));
hx = 2*f0/fs*sinc(2*f0/fs*(tx-R/2));

h = hx(:).*hamming(K);

figure(4);
stem(tx,h,"b."); xlim([0,R]);

Df = fs/K;
F = 0:Df:Df*K-Df;
H = fft(h);

[H1, F1] = freqz(h,1,K*200,fs);

figure(5);
stem(F1,abs(H1),"g.");hold on; xlim([0,fs/2]);
stem(F,abs(H),"r."); 

%fir_1;
%fir_3;

dt = 0.000001;

mode = 2;
switch(mode)
    case 1
        fs=8000; Dt = 1/fs;
        t = 0-Dt*5:dt:K*Dt+5*Dt;
        x = cos(2*pi*450*t)+cos(2*pi*1200*t)+cos(2*pi*1800*t)+cos(2*pi*3150*t);
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 2
        fs=16000; Dt = 1/fs;
        t = 0-Dt*5:dt:K*Dt+5*Dt;
        x = cos(2*pi*450*t)+cos(2*pi*1200*t)+cos(2*pi*1800*t)+cos(2*pi*3150*t);
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
    case 3
        fs=4000; Dt = 1/fs;
        t = 0-Dt*5:dt:K*Dt+5*Dt;
        x = cos(2*pi*450*t)+cos(2*pi*1200*t)+cos(2*pi*1800*t);
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx);
    case 4
        fs=4000; Dt = 1/fs;
        t = 0-Dt*5:dt:K*Dt+5*Dt;
        x = cos(2*pi*450*t)+cos(2*pi*1200*t)+cos(2*pi*1800*t)+cos(2*pi*3150*t);
        tx = 0:Dt:K*Dt-Dt;
        xs = cos(2*pi*450*tx)+cos(2*pi*1200*tx)+cos(2*pi*1800*tx)+cos(2*pi*3150*tx);
end

y = conv(xs,h);
tx2 = 0:Dt:(length(y))*Dt-Dt;

figure(6);
subplot(3,1,1);
%plot(t,x,"g"); hold on;
stem(tx,xs,"r.");hold on; title("x");
subplot(3,1,2);
stem(tx,h,"b.");title("h");
subplot(3,1,3);
stem(tx2,y,"g.");title("y");

Df = fs/K;
f = 0:Df:Df*K-Df;

X = fft(xs);
H = fft(h);
Y = X(:).*H;

figure(7);
subplot(3,1,1);
%plot(t,x,"g"); hold on;
stem(f,abs(X),"r.");hold on; xlim([0,fs/2]);title("X");
subplot(3,1,2);
stem(f,abs(H),"b.");xlim([0,fs/2]);title("H");
subplot(3,1,3);
stem(f,abs(Y),"g.");xlim([0,fs/2]);title("Y");

