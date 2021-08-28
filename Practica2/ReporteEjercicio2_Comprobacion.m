clc;clear all;close all;
Q = 20e-6
origen = [0 0 0]
v1 = [4 0 0]
v2 = [4 2 0]
y = 0;
func1 = @(x)((x/2)+(2*y));
integral = quad(func1, origen(1), v1(1));
Wx = Q*integral

x = 4;
func2 = @(y)(2*x);
integral2 = quad(func2, origen(1), v2(2));
Wy = Q*integral2

func3 = @(z)((5/2)*z);
intregal3 = quad(func3, v1(1), origen(1));
W = Q*intregal3

igualdad = W + (Wx + Wy) 