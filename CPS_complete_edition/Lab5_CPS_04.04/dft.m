clc; clear; close all;

dt = 0.000001;
t = 0:dt:0.001;

f0 = 3000;
s = -1/4 + sin(2*pi*f0*t);

fs = 10000;
Dt = 1/fs;

N = 10;

ts = 0:Dt:(N-1)*Dt;

x = -1/4 + sin(2*pi*f0*ts)

figure(1);
plot(t,s, "r"); hold on; grid on;
stem(ts,x,'b.', MarkerSize=10);

Df = fs/N;

f = 0:Df:(N-1)*Df;

X = calcDFT(x)
figure(2);
subplot(2,1,1);
stem(f,fftshift(abs(X)),"c.", MarkerSize=10);hold on;
subplot(2,1,2);
stem(f,fftshift(angle(X)/pi),"c.", MarkerSize=10);hold on;

X_spr = fft(x)
subplot(2,1,1);
stem(f,fftshift(abs(X_spr)),"m.", MarkerSize=10);
subplot(2,1,2);
stem(f,fftshift(angle(X_spr))/pi,"m.", MarkerSize=10);

err = max(abs(X-X_spr(:)))

x_i = calcIDFT(X)

figure(1);
stem(ts,x_i,"m.", MarkerSize=5);

x_ispr = ifft(X);

err2 = max(abs(x_i-x_ispr))

s2 = -1/4 + 1/2 * cos(6000*pi*t-pi/2) + 1/2 * cos(6000*pi*t-pi/2);

s_2 = zeros(1,length(t));


%for n=1:length(x):

%end

figure(1);
plot(t,s2,"g");

y = rand(1,4)*10
z = rand(1,4)*10

Y = calcDFT(y);
Z = calcDFT(z);

a = 3;
b = 4;

dft_lin = calcDFT(a*y + b*z)
comp_dft_lin = a*Y + b*Z

err3 = max(abs(dft_lin- comp_dft_lin))

sk = rand(1,4)*10
SK = calcDFT(sk);

%sk2 = sk*