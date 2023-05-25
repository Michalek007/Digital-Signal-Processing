function X = calcDFT(x)

N = length(x);

n = 0:N-1;
k = 0:N-1;

w=exp(-j*2*pi/N);

A = w.^(k(:)*n);
X = A*x(:);

end