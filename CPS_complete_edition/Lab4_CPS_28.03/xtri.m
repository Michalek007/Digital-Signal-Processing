function y = xtri(t)
y = zeros(1,length(t));
y(t>-1 & t<=0) = 1 + t(t>-1 & t<=0);
y(t>=0 & t<1) = 1- t(t>=0 & t<1);
