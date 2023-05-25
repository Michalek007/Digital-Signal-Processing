function y =  x_impuls(b, a, L)

x = [1];
for i=1:L-1
    x = [x, 0];
end

y = x_filter(b, a , x);

end

