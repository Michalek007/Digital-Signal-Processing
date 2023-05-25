function y = odp_imp(h,L)

if (L<length(h))
    L = length(h);
end
y = zeros(1,L);
hk = [h,zeros(1,L-length(h))];
x = [1,zeros(1,L-1)];

for m=1:L
   y = y + hk(m)*x;
   x = [0,x(1:end-1)];
end

