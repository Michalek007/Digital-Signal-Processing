clc; clear; close all;
N = 15;
to = 0;
fs = 3000;
f0 = 600;

Ts = 1/fs;

t = 0:Ts:Ts*(N-1);
t_cont = 0:1e-6:t(end);
f = (0:1:N-1).*fs/N;

ft = sin(2*pi*f0*t);
ft_cont = sin(2*pi*f0*t_cont);

% figure(1)
% stem(t,ft); grid on; hold on;
% plot(t_cont, ft_cont); hold off;
E_t1 = sum(ft.*ft);


ff = fft(ft)/N;
% figure(2)
% stem(f,abs(ff)); grid on; hold on;
% stem(f, real(ff), 'r');
% E_f1 = sum(abs(ff).*abs(ff));
% 
% figure(3)
% stem(f,abs(ff)); grid on; hold on;
% stem(f, imag(ff), 'b');
% 
% figure(4)
% stem(f,abs(ff)); grid on; hold on;
% plot(f, abs(ff), 'b');



% ft_test = ifft(ff)*N;
% figure(3)
% stem(t,ft_test); hold on; grid on;
% plot(t_cont,ft_cont);


n = 0:N-1;
ft_shannon = zeros(size(t_cont));
for q = 1:length(ft)
    ft_shannon = ft_shannon + ft(q)*sinc(fs*(t_cont-n(q)*Ts-min(t_cont)));
end
% 
% figure(4)
% plot(t_cont,ft_shannon); grid on; hold on;
% plot(t_cont, ft_cont);

% 
f02 = 666;
ft2 = sin(2*pi*f02*t);
ft2_cont = sin(2*pi*f02*t_cont);
E_t2 = sum(ft.*ft);
E_f2 = sum(abs(ff).*abs(ff));

ff2 = fft(ft2)/N;
ff3 = [];
for n=1:2*length(ff2)
    if (mod(n, 2) == 0)
        ff3(n) = 0;
    else
        ff3(n) = ff2(ceil(n/2));
    end
end
figure(1)
grid on; hold on;
%plot(f,abs(ff3),'g'); 
stem(f,abs(ff),'b');
hold off;


% figure(2)
% grid on; hold on;
% stem(f,angle(ff2),'g'); 
% stem(f,phase(ff),'b');
% hold off;
% ff_error = abs(ff2 - ff);
% figure(2)
% stem(f,ff_error);






