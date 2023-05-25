clc; clear; close all;

dt = 0.001;
t = -5:dt:10;

A = 3; a = 2; b = 3;

xp = A*xpi((t-b)/a);
xt = A*xtri((t-b)/a);
figure(1);
subplot(2,1,1); 
plot(t,xp,"b.-");grid on;
subplot(2,1,2);
plot(t,xt,"r.-");

x3a = 3*xpi((t-3.5)/3) + xpi((t-5.5)) + 2*xpi((t-7.5)/3) + xtri((t-7.5)/1.5);
x3b = 4*xtri((t-5)/4) - 2*xtri((t-5)/2);
figure(2);
subplot(2,1,1);
plot(t,x3a,"b.-");grid on;xlim([0,10]);
subplot(2,1,2);
plot(t,x3b,"r.-");xlim([0,10]);

A1 = 2; f1 = 2; t0_1 = 0; n1 = 4; T1 = 1/f1;
sinP = A1*sin(2*pi*f1*t) .* xpi((t-t0_1-(n1*T1)/2)/(n1*T1));
winP = xpi((t-t0_1-(n1*T1)/2)/(n1*T1));

A2 = 4; f2 = 3; t0_2 = 1; n2 = 6; T2 = 1/f2;
sinT = A2*sin(2*pi*f2*t) .* xtri((t-t0_2-(n2*T2)/2)/((n2*T2)/2));
winT = xtri((t-t0_2-(n2*T2)/2)/((n2*T2)/2));

figure(3);
subplot(2,1,1);
plot(t,winP,"r.-");hold on;
plot(t,sinP,"b.-");grid on;xlim([-1,3]);
subplot(2,1,2);
plot(t,winT,"b.-"); hold on;
plot(t,sinT,"r.-"); xlim([0,4]);

%szereg
x3aSzer = zeros(1,length(t));
T = 10; ft = 1/T;
for n=1:20
    N = n-1;
    fn = ft*N;
    an(n) = 2/T * calka(x3a.*cos(2*pi*fn*t),dt);
    bn(n) = 2/T * calka(x3a.*sin(2*pi*fn*t),dt);
    x3aSzer = x3aSzer + an(n).*cos(2*pi*fn*t)+bn(n).*sin(2*pi*fn*t);
end

figure(4);
plot(t,x3a,"b.-");grid on;xlim([0,10]);hold on;
plot(t,x3aSzer,"r.-");



