function y = x_tri(x)
% Triangular signal
N = length(x);
y = zeros(1, N);
for i = 1:N
    if(x(i) >= -1 && x(i) < 0)
        y(i) = x(i) + 1;
    elseif (x(i) >= 0 && x(i) <= 1)
        y(i) = -x(i) + 1;
    end
    
end
end
