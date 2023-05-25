clc; clear; close all;

dt = 0.01;
t = -5:dt:5;

T = (length(t)-1)*dt;

N = 40;
Dt = T/N;
ts = -5:Dt:5;

s = xpi(t/5);
xn = xpi(ts/5);

XK = calcDFT(xn);

df = 1;
f = -1000:df:1000;

figure(1);
subplot(4,1,1);
plot(t,s,"r-"); hold on;
plot(ts, xn, "bo");
subplot(4,1,2);
stem(f,fftshift(abs(XK)),"mo");


