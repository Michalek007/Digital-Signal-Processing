clc; clear; close all;

dt = 0.0001;
t = 0:dt:10;

A=2; fx=1; w=1/2;

fP = xpi((t-(w*fx)/2)/(w*fx))-xpi((t-(w*fx)/2)/(fx-w*fx));

plot(t,fP);