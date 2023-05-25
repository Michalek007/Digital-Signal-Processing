clc; clear; close all;

N = 500;
fs = 1000;
Ts = 1/fs;
t = [];
y = [];
f1 = 400; f2=800; f3=621;
for n=0:N-1
    y = [y, 1 - sin(800*pi*n*Ts+0.35*pi) + 5*cos(1600*pi*n*Ts-0.75*pi) - 2*cos(2*f3*pi*n*Ts+0.73*pi)];
    t = [t, n * Ts];
end

for k=1:1000
    if (f1 == k * fs/N)
        disp("jest git");
        break;
    end
end
if (floor((f1*N)/fs)~=ceil((f1*N)/fs))
    disp("PRzeciek! (f1)")
end
if (floor((f2*N)/fs))~=ceil((f2*N)/fs)
    disp("PRzeciek! (f2)")
end
if (floor((f3*N)/fs))~=ceil((f3*N)/fs)
    disp("PRzeciek! (f3)")
end
%stem(t, y)
figure(1)
plot(t, y)
y_fft = abs(fft(y));
y_fft = fftshift(y_fft);
f = -fs/2:fs/N:fs/2-1;
figure(2)
stem(f, y_fft)
%[s, t, x, t_s, sa] = syg_sin(2, 4000, 10);
%plot(t, s)