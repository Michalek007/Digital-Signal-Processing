clear; clc; close all;
dt = 0.001;

f_0 = 1000;
k = 3;
f_s = 1700;

[y, t, x, t_s, sa] = syg_sin(k, f_0, f_s);

figure(1)
    plot(t, y, 'r'); grid on; hold on;
    stem(t_s, x, 'b');
    plot(t, sa, 'g');



e = (((y - sa).^2)/length(y)).^(0.5);
ee = 0;

for n = 1:length(y)
    ee = ee + ((y(n) - sa(n)).^2)/length(y);
end
