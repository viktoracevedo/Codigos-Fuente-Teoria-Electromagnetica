clc;clear all;close all %clear the command line
clear; %remove all previous variables
PlotXmin=-4;%valor x minimo en el espacio de la parcela
PlotXmax=4;%%valor x maximo en el espacio de la parcela
PlotYmin=-4;%valor x minimo en el espacio de la parcela
PlotYmax=4;%valor y maximo en el espacio de la parcela
PlotZmin=-4;%lvalor z minimo en el espacio de la parcela
PlotZmax=4;%valor z maximo en el espacio de la parcela
NumberOfXPlottingPoints=5;%número de puntos de trazado a lo largo del eje x
NumberOfYPlottingPoints=5;%número de puntos de trazado a lo largo del eje y
NumberOfZPlottingPoints=5;%número de puntos de trazado a lo largo del eje z
PlotStepX=(PlotXmax-PlotXmin)/(NumberOfXPlottingPoints-1);%trazar el paso en la dirección x
PlotStepY=(PlotYmax-PlotYmin)/(NumberOfYPlottingPoints-1);%trazar el paso en la dirección y
PlotStepZ=(PlotZmax-PlotZmin)/(NumberOfZPlottingPoints-1);%trazar el paso en la dirección z
[X,Y,Z]=meshgrid(PlotXmin:PlotStepX:PlotXmax,PlotYmin:PlotStepY:PlotYmax,PlotZmin:PlotStepZ:PlotZmax);%construir matrices de espacio de parcela
Fx=zeros(NumberOfZPlottingPoints,NumberOfYPlottingPoints,NumberOfXPlottingPoints);%x componente de la densidad de flujo
Fy=zeros(NumberOfZPlottingPoints,NumberOfYPlottingPoints,NumberOfXPlottingPoints);%y componente de la densidad de flujo
Fz=zeros(NumberOfZPlottingPoints,NumberOfYPlottingPoints,NumberOfXPlottingPoints);%z componente de la densidad de flujo
Q=450e-6;%carga puntual
C=[3 2 3];%localizacion de la carga puntual
F=[0 0 0];%inicializar la densidad de flujo
for k=1:NumberOfZPlottingPoints
for j=1:NumberOfYPlottingPoints
for i=1:NumberOfXPlottingPoints
Xplot=X(k,j,i);%x coordinate of current plot point
Yplot=Y(k,j,i);%y coordinate of current plot point
Zplot=Z(k,j,i);%z coordinate of current plot point
P=[Xplot Yplot Zplot];%position vector of observation points
R=P-C; %vector pointing from point charge to the current observation point
Rmag=norm(R);%magnitude of R
if (Rmag>0)% no flux line defined at the source
R_Hat=R/Rmag;%unit vector of R
F=Q*R_Hat/(4*pi*Rmag^2);%flux density of current observation point
Fx(k,j,i)=F(1,1);%get x component at the current observation point
Fy(k,j,i)=F(1,2);%get y component at the current observation point
Fz(k,j,i)=F(1,3);%%get z component at the current observation point
end
end
end
end
quiver3(X,Y,Z,Fx,Fy,Fz)
title('Simulacion Carga en el origen Q1')