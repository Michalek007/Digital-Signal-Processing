function y = odp_sys(x,b,a,L)

x = [x, zeros(1,L-length(x))];
y = zeros(1,L);
B = zeros(1,length(b));
A = zeros(1,length(a)-1);

for n=1:L
    B = [x(n),B(1:end-1)];
    y(n) = sum(b.*B)-sum(a(2:end).*A);
    A = [y(n),A(1:end-1)];
end
    