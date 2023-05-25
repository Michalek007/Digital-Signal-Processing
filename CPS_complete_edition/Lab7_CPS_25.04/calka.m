function Cx=calka(fx,dx);
% Cx=calka(fx,dx);
%
% Sygnaly i systemy
% NTK
% AGH 
%
% Metoda trapezow;
% dx - odstep na osi zmiennej niezaleznej (zakladamy staly odstep miedzy probkami!); 
% fx - wektor wartosci próbek funkcji f(x), wyznaczonych w odstepach "dx" na calkowanym przedziale;
%
% (C) P.Korohoda, 30/10/2020;

	Cx=[sum(fx(2:end-1))+0.5*(fx(1)+fx(end))]*dx;

% EOF