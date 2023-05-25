clc; clear; close all;

N = 200;
fs = 100;
xt = [];
yt = [];
t = 0:1/fs:N;
for n=1:N
    xt = [xt, x_pi((n-1)*(1/fs)-0.75)/0.99];
    yt = [yt, x_pi((n-1)*(1/fs)-1)/1.72 .* (sin(pi*(n-1)) + sin(99*pi*(n-1)))];
end

podpunkt = 4;
switch podpunkt
    case 1
        % podpunkt a
        a = [1, 0.5];
        b = [1, 1];
    case 2
        % podpunkt b
        a = [1, -0.5];
        b = [1, 1];
    case 3
        % podpunkt c
        a = [1, 3/2, -0.5];
        b = [2, -1];
    case 4
        % podpunkt d
        a = [1, 0.5, -0.5];
        b = [2, -1];
end

zadanie = 4;
if (zadanie == 1)
    signal = 0;
    switch signal
        case 0
            y = x_filter(b, a, xt);
            y_matlab = filter(b, a, xt);
        
            stem(y, 'ro'); hold on;
            stem(y_matlab, 'bx')
        case 1
            y = x_filter(b, a, yt);
            y_matlab = filter(b, a, yt);
            
            stem(y, 'ro'); hold on;
            stem(y_matlab, 'bx')
    end
    
end

if (zadanie == 2)
    L = 100;
    y = x_impuls(b, a, L);
    y_matlab = impz(b, a, L);
    
    stem(y, 'bo'); hold on; grid on;
    stem(y_matlab, 'rx');
end

if (zadanie == 3)
    L = 100;
    y = x_impuls(b, a, L);
    y_matlab = impz(b, a, L);

    y_fft = abs(fft(y));
    y_angle = angle(fft(y));

    f = 0:fs/L:fs-fs/L;
    
    %f_matlab = fftshift(f);
    %y_fft_matlab = abs(freqz(b, a, L));
    %y_angle_matlab = angle(freqz(b, a, L));
    
    figure(1)
        stem(f, y_fft, 'bo'); %("Fourier");
        %stem(f_matlab, y_fft_matlab, 'rx');
        
    figure(2)
        stem(f, y_angle, 'bo'); %tittle("Phase");
        %stem(f, y_angle_matlab, 'rx');
end

if (zadanie == 4)
    p = roots(a)
    z = roots(b)
    niestabilny = 0;
    warunkowo_stabilny = 0;
    for i = 1:length(p)
        if (abs(p(i)) > 1)
            niestabilny = 1;
            break
        end
        if (abs(p(i)) == 1)
            warunkowo_stabilny = 1;
        end
    end
    
    if (niestabilny)
        disp("system niestabilny")
    elseif (warunkowo_stabilny)
        disp("system warunkowo stabilny")
    else
        disp("system stabilny")
    end
  
    hold on; grid on;
    ax = gca; ax.XAxisLocation = 'origin'; ax.YAxisLocation = 'origin';
    r = 1;
    p_k = 0:0.01:2*pi;
    x_k = sin(p_k) * r;
    y_k = cos(p_k) * r;
    plot(y_k, x_k)

    plot(real(p), imag(p), 'rx', 'MarkerSize',10)
    plot(real(z), imag(z), 'bo', 'MarkerSize',10)
end