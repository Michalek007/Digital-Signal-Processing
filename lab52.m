fs = 10000;
fo = 4000;
Ts = 1 / fs;
N = 10;

an = zeros(size(N));
ts = [];
for n=1:N
    an(n) = sin(2*pi*fo*(n-1)*Ts) + 1/4;
    ts = [ts, (n-1)*Ts];
end
ak = fft(an);
ak = fftshift(ak);

bn = zeros(size(N));
ts = [];
for n=1:N
    bn(n) = cos(2*pi*fo*(n-1)*Ts+pi/2);
    ts = [ts, (n-1)*Ts];
end
bk = fft(bn);
bk = fftshift(bk);


cn = zeros(size(N));
ts = [];
for n=1:N
    cn(n) = sin(2*pi*fo*(n-1)*Ts) + cos(2*pi*fo*(n-1)*Ts+pi/2);
    ts = [ts, (n-1)*Ts];
end

ck = fft(cn);
ck = fftshift(ck);

E_t = sum(an.*an);
E_f = 1/N * sum(abs(ak).*abs(ak));
display(E_t - E_f)

E_t = sum(bn.*bn);
E_f = 1/N * sum(abs(bk).*abs(bk));
display(E_t - E_f)

E_t = sum(cn.*cn);
E_f = 1/N * sum(abs(ck).*abs(ck));
display(E_t - E_f)

