clc;clear all;close all;
r = 10;
z = 2;
phi = (53.2 * pi)/180;
x = round(r*cos(phi))
y = round(r*sin(phi))
D = [2*x 2*(1-y) 4*z]
x = x/10;
y = y/10;
dS = [10^-6*x 10^-6*y 0]
flujo = dot(D, dS)