clc; clear; close all;

fs = 100;
%N = 200;
N = 400;
Dt = 1/fs;
t0 = 0;

dt = 0.0001;
t = t0:dt:Dt*N-Dt;
ts = t0:Dt:Dt*N-Dt;

%x = xpi((t-1)/1.01);
%xs = xpi((ts-1)/1.01);
x = xpi((t-2)/3).*(sin(2*pi*3*t)+sin(2*pi*43*t));
xs = xpi((ts-2)/3).*(sin(2*pi*3*ts)+sin(2*pi*43*ts));

K = 51;
th = t0:Dt:Dt*K-Dt;

%h = 1/20 * sinc(fs/20*(th-1/4));
h = 1/5 * sinc(fs/5*(th-1/4));

figure(1);
subplot(2,1,1);
plot(t,x,"r"); hold on;
stem(ts,xs,"b");
subplot(2,1,2);
stem(th,h,"g"); hold on;

M = N+K-1;

tm = t0:Dt:Dt*M-Dt;

spLin = zeros(1,M);
hk = [h,zeros(1,N-1)];
xk = [xs,zeros(1,K-1)];

for m=1:M
   spLin = spLin + xk(m)*hk;
   hk = [0,hk(1:end-1)];
end

spLin2 = conv(h,xs);

figure(2);
stem(tm, spLin,"m",'MarkerSize',10); hold on;
stem(tm, spLin2,"bx");

X = fft(xs,M);
H = fft(h,M);
spKol = ifft(X.*H);

stem(tm, spKol,":diamondg");

L = 2;

y = odp_imp(h,L);

L = length(y);
tl = t0:Dt:Dt*L-Dt;
%figure(1);
figure(3);
stem(tl, y, "mx");

Hcz = fft(h);
Df = fs/K;

fh = 0:Df:Df*K-Df;

figure(4);
subplot(2,1,1);
stem(fh, abs(Hcz), "m"); xlim([0,length(fh)]);
subplot(2,1,2);
stem(fh, angle(Hcz)/pi, "m");xlim([0,length(fh)]);

