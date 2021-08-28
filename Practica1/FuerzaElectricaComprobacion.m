clc;clear all;close al;
%Permitividad del espacio libre e0
e0=8.854e-12;

%Magnitud de las cargas Q1 y Q2
Q1=450e-6;
Q2=-250e-6;

%Posicion en el plano de x,y,z
x1=3;  %posicion x de Q1
y1=2; %posicion y de Q1
z1=3; %posicion z de Q1
x2=7;  %posicion x de Q2
y2=-2; %Posicion y de Q2
z2=4; %Posicion z de Q2

%%Distancia entre cargas
r=sqrt((x2-x1).^2+(y2-y1).^2+(z2-z1).^2)

%%Vector de direccion
ax=(x2-x1)./r;
ay=(y2-y1)./r;
az=(z2-z1)./r;
a=[ax;ay;az]

%%Aplicamos la Ley de Coulomb
F21=(ones(3,1)*((Q1*Q2)/(4*pi*e0*r.^2))).*a