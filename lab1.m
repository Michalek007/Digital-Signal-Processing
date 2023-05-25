close; clear;
dt = 0.01;
t = -3:dt:7;
Nt = length(t);

pi = x_pi(t);
lambda = x_tri(t);

figure(1)
    plot(t, pi); grid on; title("Pi"); xlabel("time"); ylabel("amplitude");
figure(2)
    plot(t, lambda); grid on; title("Tri"); xlabel("time"); ylabel("amplitude");

s1 = 5 * x_pi((t-2)/4);
s2 = 5 * x_tri((t-2)/4);

figure(3)
    plot(t, s1); grid on; title("Pi"); xlabel("time"); ylabel("amplitude");
figure(4)
    plot(t, s2); grid on; title("Tri"); xlabel("time"); ylabel("amplitude");


s3 = 2*x_tri(t-2) + x_pi(t-4.5) + x_pi((t-3)/4);

t2 = 0:dt:10;
s4 = 4*x_tri((t2-5)/2) .* x_pi((t2-3)/4) + 4*x_tri((t2-7)/3) .* x_pi((t2-10)/6) + 4*x_pi((t2-6)/2);
figure(5)
    plot(t, s3); grid on; title("S3.1"); xlabel("time"); ylabel("amplitude");
figure(6)
    plot(t2, s4); grid on; title("S3.2"); xlabel("time"); ylabel("amplitude");
