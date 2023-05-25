function y = x_pi(x)
% Rectangular signal
N = length(x);
y = zeros(1, N);
for i = 1:N
    if(x(i) > -0.5 && x(i) < 0.5)
        y(i) = 1;
    elseif (abs(x(i)) == 0.5)
        y(i) = 0.5;
    end
    
end
end