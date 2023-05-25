function x = calcIDFT(X)

N = length(X);

n = 0:N-1;
k = 0:N-1;

w=exp(-j*2*pi/N);

A = w.^(k(:)*n);
B = inv(A);
x = B*X(:);