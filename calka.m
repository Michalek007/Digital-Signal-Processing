function c=calka(y,dx)
% c=calka(y,dx)
%
% najprostsza implementacja metody trapezów;
%
% Opracowal: P.Korohoda, 8.10.2022

c=( sum(y)-(y(1)+y(end))/2 )*dx;

% EOF;