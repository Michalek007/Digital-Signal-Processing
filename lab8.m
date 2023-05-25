clc; clear; close all; 
%1. FDP - odpowiedz impulsowa

fp = 1250;
fr = 1750;
fs = 8000;
Rr = 50;
f0 = (fr - fp) /2;


fir_1

% a) metoda okien czasowych
% b) metoda okien czasowych + DFT
% barlett(n)

%Rr = -50db -> okno Hamminga

Rx = abs(3.3 * fs / (fr-fp));
R = ceil(Rx);
K = R+1;
f = 0:0.001:fs/2;
% Hf = x_pi(f/((2*f0/fs))).*exp(-j*2*pi*f*R/2);
%plot(f, abs(Hf),'r'); grid on; hold on; %xlim([-1, 1])
%ht = ifft(Hf);

hx = [];
f0x = f0/fs;
for n=0:R
    hx = [hx, 2* (f0x) * sinc(2*(f0x)*(n-R/2))];
end

hn = hx.*(hamming(K).');

fn = 0:fs/2/R:fs/2;
Hn = fft(hn);

H1 = Hn;
F1 = fn;
fir_3
