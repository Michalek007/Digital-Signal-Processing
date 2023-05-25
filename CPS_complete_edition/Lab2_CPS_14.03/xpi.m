function y = xpi(t)
y = zeros(1,length(t));
y(t==-0.5 | t==0.5) = 0.5;
y(t>-0.5 & t<0.5) = 1;
end

