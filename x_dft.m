function y = x_dft(x) % dt
% zwraca dft z x, gdzie x to wektor dyskretnych wartosci

N = length(x);
y = [];

for k = 0:N-1
    xx = 0;
    for n = 0:N-1
        xx = xx + x(n+1)*exp(-1i*2*pi*(k*n)/N);
     end
    y = [y, xx];
end
end
% N = length(x);
% w = exp(-j * 2 * pi / N);
% wn = [];
% for n=1:N
%     wn = [wn, w^(n-1)];
% end
% y = [];
% for k=1:N
%     y = [y, sum(x.*(wn.^k))];
% end
% y = fliplr(y);
% end