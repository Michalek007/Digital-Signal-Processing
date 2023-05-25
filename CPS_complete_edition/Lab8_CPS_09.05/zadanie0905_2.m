clc; clear; close all;

load("STFT_01.mat");
%load("STFT_02.mat");

X = fft(x);

t = 0:Ts:(N-1)*Ts;
koniec = t(end)


M = 25;

for l=0:(N/M)-1
xp = x(1+M*l:M*(l+1));
xw(l) = xp(:) .* hamming(M);
end


TsM = length(t)*Ts/(N/M);

tM = 0:TsM:t(end);
koniec2 = tM(end);

figure(1);
%stft(x,fs);
%spectrogram(X,hamming(100),N,100,1e3);
figure(2);
%stft(xw,fs);
plot(xw);
