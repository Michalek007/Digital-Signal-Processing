function y = x_filter(b, a, x)

N = length(x);
y = zeros(1, N);
Nm = length(b);
Nk = length(a);

suma = 0;
for n=1:N
    suma = 0;
    for m=1:Nm
        if (n+1-m<1)
        else
            suma = suma + b(m) * x(n+1-m);
        end
    end
    for k=2:Nk
        if (n+1-k < 1)
        else
            suma = suma - a(k) * y(n+1-k);
        end
    end
    y(n) = suma;
end

end
