function [s x] = syg_sin(k, f0, fs, N)

dt = 0.0001;
t = -1/f0*1.5*k:dt:1/f0*1.5*k;

noise = (rand(1,length(t))-0.5)/5;

sinus = sin(2*pi*f0*t)+noise;
win = xpi(t/(2*k*1/f0));
s = sinus.*win;

Dt = 1/fs;
tp = t(1)+rand*Dt:Dt:t(end);

sinusP = sin(2*pi*f0*tp);
winP = xpi(tp/(2*k*1/f0));
x = sinusP.*winP;


sa = zeros(1,length(t));
for n = 1:length(x)
    sa = sa + x(n)*sinc(fs*(t-tp(n)));
end

df = 0.01;
f = -1.5*fs/2:df:1.5*fs/2;

tranS = zeros(1,length(f));
tranSa = zeros(1,length(f));
tranSb = (j*k/f0)*(sinc((f+f0)*2*k/f0)-sinc((f-f0)*2*k/f0));
tranSab = zeros(1,length(f));

for n=1:length(x)
    tranSab = tranSab + (x(n)/fs)*xpi(f/fs).*exp(-j*2*pi*f*tp(n));
end

for n=1:length(f)
    tranS(n) = calka(s.*exp(-j*2*pi*f(n)*t),dt);
    tranSa(n) = calka(sa.*exp(-j*2*pi*f(n)*t),dt);
end

figure(N);
subplot(2,1,1);
plot(t,s, "r-"); hold on; grid on; ylim([-2,2]);
stem(tp, x, "b.", "MarkerSize", 10);
plot(t,sa,"g-");
subplot(2,1,2);
plot(f,abs(tranS),"r-");hold on; grid on;
plot(f,abs(tranSa),"g-");
plot(f,abs(tranSb),"b-");
plot(f,abs(tranSab),"m-");


roznica = s - sa;
metryka = sqrt(calka(roznica.*conj(roznica),dt));
disp("  błąd = " + metryka);



