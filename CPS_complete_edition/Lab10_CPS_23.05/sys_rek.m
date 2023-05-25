clc; clear; close all;

selSys = 5;

switch selSys
    case 1
        b = [2, 3];
        a = [1, -1/2];
    case 2
        b = [2, 3];
        a = [1, 1/2];
    case 3
        b = [2, -1];
        a = [1, 3/2, -1/2];
    case 4
        b = [2, -1];
        a = [1, 1/2, -1/2];
    case 5
        b = [1];
        a = [1, 1/2];
    case 6
        b = [1];
        a = [1, -1/2];
end

% zad.1

fs = 20;
N = 50;
t0 = 0;
Dt = 1/fs;

ts = t0:Dt:t0+Dt*N-Dt;

x = xpi((ts-0.7)/0.99);

L = 80;
y = odp_sys(x,b,a,L);

figure(1);
subplot(3,1,1); 
stem(ts,x,"r");title("x(t)")

ts2 = t0:Dt:t0+Dt*L-Dt;

subplot(3,1,2);
stem(ts2,y,"g");hold on; xlim([t0,t0+Dt*N-Dt]);title("y(t)");

y2 = filter(b,a,x);

stem(ts,y2,"mx");

% zad.2

h = odp_imp_2(b,a,L);

subplot(3,1,3);
stem(ts2,h,"b"); hold on;xlim([t0,t0+Dt*N-Dt]);title("h(t)");

h2 = impz(b,a);
L2 = length(h2);
ts3 = t0:Dt:t0+Dt*L2-Dt;
stem(ts3,h2,"mx");

% zad.3

Hcz = fft(h);
K = length(h);
Df = fs/K;

fh = 0:Df:Df*K-Df;

K2 = round(K/2);

if (mod(K,2) == 0)
    f_shifted = -fs/2:Df:fs/2-Df;
else
    f_shifted = -fs/2+Df/2:Df:fs/2-Df/2;
end

figure(2);
subplot(2,1,1);
plot(fh, abs(Hcz), "m"); %xlim([fh(1),fh(round(K/2))]);
subplot(2,1,2);
plot(fh, angle(Hcz)/pi, "m");%xlim([fh(1),fh(round(K/2))]);

% zad.4

z = roots(b)
p = roots(a)
circle = nsidedpoly(1000, 'Center', [0 0], 'Radius', 1);

figure(3);
plot(circle, 'FaceColor', 'none'); axis equal; grid on; hold on;
stem(real(z),imag(z),"mo");
stem(real(p),imag(p),"rx");


