function [s x] = syg_sin(k, f0, fs, fig)

dt = 0.00001;
t = -1/f0*1.5*k:dt:1/f0*1.5*k;

sinus = sin(2*pi*f0*t);
win = xpi(t/(2*k*1/f0));
s = sinus.*win;



Dt = 1/fs;
tp = t(1):Dt:t(end);

sinusP = sin(2*pi*f0*tp);
winP = xpi(tp/(2*k*1/f0));
x = sinusP.*winP;


sa = zeros(1,length(t));
for n = 1:length(x)
    sa = sa + x(n)*sinc(fs*(t-tp(n)));
    figure(fig);
    plot(t,s, "r-"); hold on; grid on;
    stem(tp, x, "b.", "MarkerSize", 10);
    plot(t,sa,"g-")
    pause;
end

roznica = s - sa;
metryka = sqrt(calka(roznica.*conj(roznica),dt));
disp("  błąd = " + metryka);

