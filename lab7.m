clc; clear; close all;
h = [2, 5, 7, 8, 7 ,7];
x = rand(1,4);
y = x_conv(h, x);

y2 = conv(h, x);
y2
y11 = x_cconv(h, x);
y12 = cconv(h, x);
y11
y12

% 
% N = 200;
% fs = 100;
% dt = 1/fs;
% t = 0:dt:N*dt;
% t(end) = [];
% 
% x = [];
% for n=1:N
%     x = [x, x_pi((n*dt-1)/1.01)];
% end
% 
% k = 51;
% tk = 0:dt:k*dt;
% tk(end) = [];
% h1 = [];
% for n=1:k
%     h1 = [h1, 1/20 * sinc((fs/20)*(tk-0.25))];
% end
% stem(t, x)
% stem(tk, h1)