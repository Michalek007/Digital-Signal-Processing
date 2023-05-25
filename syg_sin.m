function [s, t, x, t_s, sa] = syg_sin(k, f_0, f_s)
% sygnal sinusoidalny o częstoliwości f0
% zwraca wartości dla k okresów

t = linspace(-(k+1)/f_0,(k+1)/f_0,5e3);
s = sin(2*pi*f_0*t) .* x_pi(t/(2*k/f_0));

Ts = 1 / f_s;
t_s = min(t) : Ts :max(t);
x = sin(2*pi*f_0*t_s) .* x_pi(t_s/(2*k/f_0));

N = length(x);
n = 0:N-1;

sa = zeros(size(t));
for q = 1:length(x)
    sa = sa + x(q)*sinc(f_s*(t-n(q)*Ts-min(t)));
end

% 
% 
% 
% 
% dt = 1/f_s / 1000;
% Ts = 1 / f_s;
% 
% T = 2*k*(1/2*pi*f_0);
% L = 2 * T;
% t = -L:dt:L;
% s = sin(2*pi*f_0.*t) .* x_pi(t/(2*k));
% 
% x = [];
% t_s = [];
% 
% 
% for n=-(L*f_s):(L*f_s)
%     x = [x, sin(2*pi*f_0*n*Ts) .* x_pi(n*Ts/(2*k))];
%     t_s = [t_s, n*Ts];
% end
% 
% Nx = length(x);
% sa = zeros(1, length(t));
% % if (mod(Nx, 2) == 1)
% %     x = [x, 0];
% % end
% 
% for n=-(L*f_s)+1:(L*f_s)
%     sa = sa + x(n+(L*f_s))*sinc(f_s*(t+0.1-n*Ts));
% end
