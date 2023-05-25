function h = odp_imp_2(b,a,L)

h = zeros(1,L);
B = zeros(1,length(b));
A = zeros(1,length(a)-1);
B(1) = 1;

for n=1:L
   h(n) = sum(b.*B)-sum(a(2:end).*A);
   B = [0,B(1:end-1)];
   A = [h(n),A(1:end-1)];
end
    