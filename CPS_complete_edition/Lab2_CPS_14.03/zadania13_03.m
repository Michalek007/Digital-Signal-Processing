clc; clear; close all;

dt = 0.0001;     df = 0.005;
t = -5:dt:10;   f = -2:df:2;

% zadanie 1

xt = xpi((t-4)/2);
xp = xtri((t-2)/4);

%plot(t,xp);

% z definicji

for n=1:length(f)
    tranP(n) = calka(xp.*exp(-j*2*pi*f(n)*t),dt);
    tranT(n) = calka(xt.*exp(-j*2*pi*f(n)*t),dt);
end

% z pary sygnał transformata

tranT2 = 2*sinc(2*f).*exp(-j*2*pi*f*4);
tranP2 = 4*(sinc(4*f).^2).*exp(-j*2*pi*f*2);

figure(1);
subplot(2,1,1);
plot(f,abs(tranP),"r.-");hold on;grid on;
plot(f,abs(tranP2),"b.-");
subplot(2,1,2);
plot(f,angle(tranP)/pi,"r.-");hold on; grid on;
plot(f,angle(tranP2)/pi,"b.-");

errP = max(abs(tranP-tranP2))
errT = max(abs(tranT-tranT2))

% zadanie 2

