clc; clear; close all;

fs = [300,700,1500];
%fs = 3000:2000:12000;
for n=1:length(fs)
    disp("fs = " + fs(n));
    syg_sin(5,1000,fs(n),n);
end