clear; clc; close all;
%normalne działanie programu
% [s, t, x, t_s, sa] = syg_sin(2,1,10);
% plot(t,s,'b'); hold on; grid on;
% stem(t_s,x,'r');
% plot(t,sa,'g');

%aliasing
% [s, t, x, t_s, sa] = syg_sin(10,20,15);
% plot(t,s,'b'); hold on; grid on;
% stem(t_s,x,'r');
% plot(t,sa,'g');

fo = 1000;
fs = rand*50 : 50+rand*50 : 7000;
%wykres RMSE(fs) ?

%błąd RMSE i jego wykres
% RMSE = [];
% nn = [];
% for n = 1:length(fs)
%     [s, t, x, t_s, sa] = syg_sin(12,fo,fs(n));
%     RMSEx = sum(power(abs(s-sa), 2));
%     RMSE = [RMSE,nthroot(RMSEx/length(t), 2)];
%     nn = [nn,fs(n)];
% end
% figure(1)
% plot(t,s,'b'); hold on; grid on;
% stem(t_s,x,'r');
% plot(t,sa,'g');
% 
% figure(2)
% stem(nn,RMSE);

%próbkowanie krytyczne
% [s, t, x, t_s, sa] = syg_sin(10,20,40);
% plot(t,s,'b'); hold on; grid on;
% stem(t_s,x,'r');
% plot(t,sa,'g');

%widmo
% [s, t, x, t_s, sa] = syg_sin(2,1,10);
% df = 0.01;
% f = -30:df:30;
% Nf=length(f);
% dt = 5e3;
% for z=1:Nf
%     S(z)=calka(s.*exp(-j*2*pi*f(z)*t),dt);
% end
% 
% for z=1:Nf
%     SA(z)=calka(s.*exp(-j*2*pi*f(z)*t),dt);
% end
% figure(1)
% plot(t,s,'b'); hold on; grid on;
% stem(t_s,x,'r');
% plot(t,sa,'g');
% 
% figure(2)
% plot(f,S,'b');
% 
% figure(3)
% plot(f,SA,'b');