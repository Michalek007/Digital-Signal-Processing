clc; clear; close all;

fs = 10000;

N = 10;
Dt = 1/fs;

dt = 0.000001;
%t = 0:dt:Dt*(N);
t = -4*Dt:dt:Dt*(N+4);

f0 = 3000;
s = (-1/4 + sin(2*pi*f0*t)) .* xpi((t-Dt*N/2)/(Dt*N));

ts = 0:Dt:(N-1)*Dt;

x = -1/4 + sin(2*pi*f0*ts);

figure(1);
plot(t,s, "r"); hold on; grid on;
stem(ts,x,'b.', MarkerSize=10);

Df = fs/N;

f = 0:Df:(N-1)*Df;

df = 0.01;

if (mod(N,2) == 0)
    f_shifted = -fs/2:Df:fs/2-Df;
    F = -fs:df:fs-Df;
else
    f_shifted = -fs/2+Df/2:Df:fs/2-Df/2;
    F = -fs+Df/2:df:fs-Df/2;
end

X = calcDFT(x)
figure(2);
subplot(2,1,1);
stem(f_shifted,fftshift(abs(X)),"c.", MarkerSize=10);hold on;
subplot(2,1,2);
stem(f_shifted,fftshift(angle(X)/pi),"c.", MarkerSize=10);hold on;

X_spr = fft(x)
subplot(2,1,1);
stem(f_shifted,fftshift(abs(X_spr)),"m.", MarkerSize=10);
subplot(2,1,2);
stem(f_shifted,fftshift(angle(X_spr)/pi),"m.", MarkerSize=10);

err = max(abs(X-X_spr(:)))

x_i = calcIDFT(X)

figure(1);
stem(ts,x_i,"m.", MarkerSize=5);

x_ispr = ifft(X);

err2 = max(abs(x_i-x_ispr))

%s2 = -1/4 + 1/2 * cos(6000*pi*t-pi/2) + 1/2 * cos(6000*pi*t-pi/2);

s_2 = zeros(1,length(t));


%for n=1:length(x):

%end

%figure(1);
%plot(t,s2,"g");

y = rand(1,4)*10
z = rand(1,4)*10

Y = calcDFT(y);
Z = calcDFT(z);

a = 3;
b = 4;

dft_lin = calcDFT(a*y + b*z)
comp_dft_lin = a*Y + b*Z

err3 = max(abs(dft_lin- comp_dft_lin))

en = rand(1,4)*10;
en = en(:);
EN = calcDFT(en);

n = 4;

energ = sum(abs(en).^2)
ENERG = 1/n * sum(abs(EN).^2)

err4 = max(abs(energ-ENERG))

tran = zeros(1,length(F));

for n=1:length(F)
    tran(n) = calka(s.*exp(-j*2*pi*F(n)*t),dt);
end

tran = fs*tran;

figure(2);
subplot(2,1,1);
plot(F, abs(tran), "r");
subplot(2,1,2);
plot(F, angle(tran)/pi, "b");

s_od = zeros(1,length(t));
S_od = zeros(1,length(F));
for n=1:N-1
    s_od = s_od + x(n).*sinc(fs*(t-(n-1)*Dt));
    S_od = S_od + tran(F-n*Df);
end

figure(2);
subplot(2,1,1);
plot(F,abs(S_od),"g");

