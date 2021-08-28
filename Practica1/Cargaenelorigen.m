clc;clear all;close all %clear the command line
clear; %remove all previous variables
PlotXmin=-2;%lowest x value on the plot space
PlotXmax=2;%%maximum x value on the plot space
PlotYmin=-2;%lowest y value on the plot space
PlotYmax=2;%maximum y value on the plot space
PlotZmin=-2;%lowest z value on the plot space
PlotZmax=2;%maximum z value on the plot space
NumberOfXPlottingPoints=5;%number of plotting points along the x axis
NumberOfYPlottingPoints=5;%number of plotting points along the y axis
NumberOfZPlottingPoints=5;%number of plotting points along the z axis
PlotStepX=(PlotXmax-PlotXmin)/(NumberOfXPlottingPoints-1);%plotting step in the x direction
PlotStepY=(PlotYmax-PlotYmin)/(NumberOfYPlottingPoints-1);%plotting step in the y direction
PlotStepZ=(PlotZmax-PlotZmin)/(NumberOfZPlottingPoints-1);%plotting step in the z direction
[X,Y,Z]=meshgrid(PlotXmin:PlotStepX:PlotXmax,PlotYmin:PlotStepY:PlotYmax,PlotZmin:PlotStepZ:PlotZmax);%build arrays of plot space
Fx=zeros(NumberOfZPlottingPoints,NumberOfYPlottingPoints,NumberOfXPlottingPoints);%x component of flux density
Fy=zeros(NumberOfZPlottingPoints,NumberOfYPlottingPoints,NumberOfXPlottingPoints);%y component of flux density
Fz=zeros(NumberOfZPlottingPoints,NumberOfYPlottingPoints,NumberOfXPlottingPoints);%z component of the flux density
Q=5e-6;%point charge
C=[0 0 0];%location of the point charge
F=[0 0 0];%initialize the flux density
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
title('Simulacion Carga en el origen (Eric)')